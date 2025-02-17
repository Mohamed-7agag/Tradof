import 'package:animate_do/animate_do.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../logic/auth_cubit/auth_cubit.dart';
import 'otp_widget.dart';

class OtpWidgetAndButton extends StatelessWidget {
  const OtpWidgetAndButton({required this.pageController, super.key});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OtpWidget(),
        verticalSpace(38),
        BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state.status.isOtpVerification) {
              pageController.nextPage(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeInOut,
              );
            } else if (state.status.isError) {
              errorToast(context, 'Error', state.errorMessage);
            }
          },
          builder: (context, state) {
            return state.status.isLoading
                ? const CustomLoadingWidget()
                : SlideInUp(
                    from: 400,
                    child: CustomButton(
                      text: 'Continue',
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (state.otp.length == 6) {
                          context.read<AuthCubit>().otpVerification();
                        } else {
                          errorToast(
                            context,
                            'Invalid OTP',
                            'Please enter a valid OTP',
                          );
                        }
                      },
                    ),
                  );
          },
        ),
      ],
    );
  }
}

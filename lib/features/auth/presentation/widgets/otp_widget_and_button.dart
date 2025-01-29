import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../logic/auth_cubit/auth_cubit.dart';
import 'otp_widget.dart';

class OtpWidgetAndButton extends StatefulWidget {
  const OtpWidgetAndButton({super.key, required this.pageController});
  final PageController pageController;
  @override
  State<OtpWidgetAndButton> createState() => _OtpWidgetAndButtonState();
}

class _OtpWidgetAndButtonState extends State<OtpWidgetAndButton> {
  String otp = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OtpWidget(onSubmit: (pin) {
          log('pin: $pin');
          setState(() {
            otp = pin;
          });
        }),
        verticalSpace(38),
        BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state.status.isOtpVerification) {
              widget.pageController.nextPage(
                duration: Duration(milliseconds: 350),
                curve: Curves.easeInOut,
              );
            }else if(state.status.isError){
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
                        log('OTP: $otp');
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (otp.length == 6) {
                          context.read<AuthCubit>().otpVerification(otp);
                        } else {
                          errorToast(
                              context, 'Invalid OTP', 'Please enter a valid OTP');
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

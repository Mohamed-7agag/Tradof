import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/di/di.dart';
import 'package:tradof/core/utils/widgets/custom_button.dart';
import 'package:tradof/core/utils/widgets/custom_toastification.dart';
import 'package:tradof/features/company/company_setting/data/model/social_media_model.dart';
import 'package:tradof/features/company/company_setting/presentation/logic/cubit/company_setting_cubit.dart';


class AddUpdateSocialMediaButton extends StatelessWidget {
  const AddUpdateSocialMediaButton(
      {super.key,
      required this.facebookController,
      required this.linkedinController,
      required this.gamilController});

  final TextEditingController facebookController;
  final TextEditingController linkedinController;
  final TextEditingController gamilController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompanySettingCubit(getIt()),
      child: BlocConsumer<CompanySettingCubit, CompanySettingState>(
        listener: (context, state) {
          if (state.status.isAddUpdateSocialMediaSuccess) {
            successToast(context, 'Success', state.message);
          } else if (state.status.isAddUpdateSocialMediaFailure) {
            errorToast(context, 'Error', state.errMessage);
          }
        },
        builder: (context, state) {
          return CustomButton(
            text: 'Save',
            onPressed: () {
              context.read<CompanySettingCubit>().addUpdateSocialMedia(
                socialMediaModel: [
                 if (facebookController.text.isNotEmpty) SocialMediaModel(
                    platformType: 'Facebook',
                    link: facebookController.text,
                  ),
                if (linkedinController.text.isNotEmpty)  SocialMediaModel(
                    platformType: 'Linkedin',
                    link: linkedinController.text,
                  ),
                 if (gamilController.text.isNotEmpty)  SocialMediaModel(
                    platformType: 'Gamil',
                    link: gamilController.text,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

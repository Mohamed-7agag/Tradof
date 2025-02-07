import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tradof/core/utils/widgets/custom_button.dart';
import 'package:tradof/core/utils/widgets/custom_toastification.dart';

import '../logic/company_profile_cubit/company_profile_cubit.dart';
import '../../data/model/social_media_model.dart';

class AddUpdateSocialMediaButton extends StatelessWidget {
  const AddUpdateSocialMediaButton({
    super.key,
    required this.facebookController,
    required this.linkedinController,
    required this.gmailController,
    required this.githubController,
  });

  final TextEditingController facebookController;
  final TextEditingController linkedinController;
  final TextEditingController gmailController;
  final TextEditingController githubController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyProfileCubit, CompanyProfileState>(
      listener: (context, state) {
        if (state.status.isAddUpdateSocialMediaSuccess) {
          successToast(context, 'Success', state.message);
          context.pop(true);
        } else if (state.status.isAddUpdateSocialMediaFailure) {
          errorToast(context, 'Error', state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomButton(
          text: 'Save',
          onPressed: () {
            context.read<CompanyProfileCubit>().addUpdateSocialMedia(
              socialMedia: [
                if (facebookController.text.isNotEmpty)
                  SocialMediaModel(
                    platformType: 'Facebook',
                    link: facebookController.text,
                  ),
                if (linkedinController.text.isNotEmpty)
                  SocialMediaModel(
                    platformType: 'Linkedin',
                    link: linkedinController.text,
                  ),
                if (gmailController.text.isNotEmpty)
                  SocialMediaModel(
                    platformType: 'Gmail',
                    link: gmailController.text,
                  ),
                if (githubController.text.isNotEmpty)
                  SocialMediaModel(
                    platformType: 'Github',
                    link: githubController.text,
                  ),
              ],
            );
          },
        );
      },
    );
  }
}

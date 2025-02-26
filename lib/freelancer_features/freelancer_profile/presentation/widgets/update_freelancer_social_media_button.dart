import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../../../../company_features/company_profile/data/model/social_media_model.dart';
import '../logic/freelancer_profile_cubit/freelancer_profile_cubit.dart';

class UpdateFreelancerSocialMediaButton extends StatelessWidget {
  const UpdateFreelancerSocialMediaButton({
    required this.facebookController,
    required this.linkedinController,
    required this.gmailController,
    required this.githubController,
    super.key,
  });

  final TextEditingController facebookController;
  final TextEditingController linkedinController;
  final TextEditingController gmailController;
  final TextEditingController githubController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FreelancerProfileCubit, FreelancerProfileState>(
      listenWhen: (previous, current) => _listenAndBuildWhen(current),
      buildWhen: (previous, current) => _listenAndBuildWhen(current),
      listener: (context, state) {
        if (state.status.isUpdateSocialMediaSuccess) {
          successToast(context, 'Success', state.message);
          context.pop(result: true);
        } else if (state.status.isUpdateSocialMediaFailure) {
          errorToast(context, 'Error', state.errMessage);
        }
      },
      builder: (context, state) {
        return state.status.isUpdateSocialMediaLoading
            ? const CustomLoadingWidget()
            : CustomButton(
                text: 'Save',
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  context.read<FreelancerProfileCubit>().updateSocialMedia(
                        socialMedia: _socialList,
                      );
                },
              );
      },
    );
  }

  List<SocialMediaModel> get _socialList {
    return [
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
    ];
  }

  bool _listenAndBuildWhen(FreelancerProfileState current) {
    return current.status.isUpdateSocialMediaSuccess ||
        current.status.isUpdateSocialMediaFailure ||
        current.status.isUpdateSocialMediaLoading;
  }
}

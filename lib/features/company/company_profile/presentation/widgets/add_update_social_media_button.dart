import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/utils/widgets/custom_button.dart';
import 'package:tradof/core/utils/widgets/custom_loading_widget.dart';
import 'package:tradof/core/utils/widgets/custom_toastification.dart';

import '../../data/model/social_media_model.dart';
import '../logic/company_profile_cubit/company_profile_cubit.dart';

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
      listenWhen: _listenAndBuildWhen,
      buildWhen: _listenAndBuildWhen,
      listener: (context, state) {
        if (state.status.isAddUpdateSocialMediaSuccess) {
          successToast(context, 'Success', state.message);
          context.pop(result: true);
        } else if (state.status.isAddUpdateSocialMediaFailure) {
          errorToast(context, 'Error', state.errorMessage);
        }
      },
      builder: (context, state) {
        return state.status.isAddUpdateSocialMediaLoading
            ? CustomLoadingWidget()
            : CustomButton(
                text: 'Save',
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  context.read<CompanyProfileCubit>().addUpdateSocialMedia(
                        socialMedia: _socialList,
                      );
                },
              );
      },
    );
  }

  bool _listenAndBuildWhen(previous, current) {
    return current.status.isAddUpdateSocialMediaSuccess ||
        current.status.isAddUpdateSocialMediaFailure ||
        current.status.isAddUpdateSocialMediaLoading;
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
}

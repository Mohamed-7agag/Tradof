import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../company_profile/data/model/social_media_model.dart';
import '../company_profile/presentation/logic/company_profile_cubit/company_profile_cubit.dart';
import '../../../core/di/di.dart';
import '../../../core/helpers/extensions.dart';
import '../../../core/utils/widgets/custom_button.dart';
import '../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../core/utils/widgets/custom_toastification.dart';

class UpdateCompanySocialMediaButton extends StatelessWidget {
  const UpdateCompanySocialMediaButton({
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
    return BlocProvider(
      create: (context) => CompanyProfileCubit(getIt()),
      child: BlocConsumer<CompanyProfileCubit, CompanyProfileState>(
        listenWhen: (previous, current) => _listenAndBuildWhen(current),
        buildWhen: (previous, current) => _listenAndBuildWhen(current),
        listener: (context, state) {
          if (state.status.isUpdateCompanySocialMediaSuccess) {
            successToast(context, 'Success', state.message);
            context.pop(result: true);
          } else if (state.status.isUpdateCompanySocialMediaFailure) {
            errorToast(context, 'Error', state.errorMessage);
          }
        },
        builder: (context, state) {
          return state.status.isUpdateCompanySocialMediaLoading
              ? const CustomLoadingWidget()
              : CustomButton(
                  text: 'Save',
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    context.read<CompanyProfileCubit>().updateSocialMedia(
                          socialMedia: _socialList,
                        );
                  },
                );
        },
      ),
    );
  }

  bool _listenAndBuildWhen(CompanyProfileState current) {
    return current.status.isUpdateCompanySocialMediaSuccess ||
        current.status.isUpdateCompanySocialMediaFailure ||
        current.status.isUpdateCompanySocialMediaLoading;
  }

  List<SocialMediaModel> get _socialList {
    return [
      SocialMediaModel(
        platformType: 'Facebook',
        link: facebookController.text,
      ),
      SocialMediaModel(
        platformType: 'Linkedin',
        link: linkedinController.text,
      ),
      SocialMediaModel(
        platformType: 'Gmail',
        link: gmailController.text,
      ),
      SocialMediaModel(
        platformType: 'Github',
        link: githubController.text,
      ),
    ];
  }
}

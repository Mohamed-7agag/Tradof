import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../auth/presentation/widgets/language_drop_down.dart';
import '../../../../company_features/company_profile/data/model/company_model.dart';
import '../../data/models/project_model.dart';
import '../logic/project_cubit/project_cubit.dart';

class UpdateProjectLanguagePair extends StatelessWidget {
  const UpdateProjectLanguagePair({
    required this.companyModel,
    required this.projectModel,
    super.key,
  });
  final CompanyModel companyModel;
  final ProjectModel projectModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LanguageDropDown(
          hint: 'From Language',
          borderColor: AppColors.grey,
          hintColor: AppColors.darkGrey,
          items: companyModel.preferredLanguages,
          isEditable: projectModel.status.value == 0,
          value: projectModel.languageFrom,
          onChanged: (value) {
            context
                .read<ProjectCubit>()
                .setCreateProjectData(fromLanguage: value);
          },
        ),
        verticalSpace(12),
        LanguageDropDown(
          hint: 'To Language',
          borderColor: AppColors.grey,
          hintColor: AppColors.darkGrey,
          items: companyModel.preferredLanguages,
          value: projectModel.languageTo,
          isEditable: projectModel.status.value == 0,
          onChanged: (value) {
            context
                .read<ProjectCubit>()
                .setCreateProjectData(toLanguage: value);
          },
        ),
      ],
    );
  }
}

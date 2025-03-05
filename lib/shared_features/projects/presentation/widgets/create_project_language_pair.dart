import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../company_features/company_profile/data/model/company_model.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../auth/presentation/widgets/language_drop_down.dart';
import '../logic/project_cubit/project_cubit.dart';

class CreateProjectLanguagePair extends StatelessWidget {
  const CreateProjectLanguagePair({required this.companyModel, super.key});
  final CompanyModel companyModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LanguageDropDown(
          hint: 'From Language',
          borderColor: AppColors.grey,
          hintColor: AppColors.darkGrey,
          items: companyModel.preferredLanguages,
          onChanged: (value) {
            context.read<ProjectCubit>().setProjectData(fromLanguage: value);
          },
        ),
        verticalSpace(12),
        LanguageDropDown(
          hint: 'To Language',
          borderColor: AppColors.grey,
          hintColor: AppColors.darkGrey,
          items: companyModel.preferredLanguages,
          onChanged: (value) {
            context.read<ProjectCubit>().setProjectData(toLanguage: value);
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../company_features/company_profile/data/model/company_model.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../auth/presentation/widgets/language_drop_down.dart';
import '../../data/models/project_model.dart';
import '../logic/project_cubit/project_cubit.dart';

class UpdateProjectLanguagePair extends StatefulWidget {
  const UpdateProjectLanguagePair({
    required this.companyModel,
    required this.projectModel,
    super.key,
  });
  final CompanyModel companyModel;
  final ProjectModel projectModel;

  @override
  State<UpdateProjectLanguagePair> createState() =>
      _UpdateProjectLanguagePairState();
}

class _UpdateProjectLanguagePairState extends State<UpdateProjectLanguagePair> {
  @override
  void initState() {
    context.read<ProjectCubit>().setProjectData(
          fromLanguage: widget.projectModel.languageFrom,
          toLanguage: widget.projectModel.languageTo,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LanguageDropDown(
          hint: 'From Language',
          borderColor: AppColors.grey,
          hintColor: AppColors.darkGrey,
          items: widget.companyModel.preferredLanguages,
          isEditable: widget.projectModel.status.value == 0,
          value: widget.projectModel.languageFrom,
          onChanged: (value) {
            context.read<ProjectCubit>().setProjectData(fromLanguage: value);
          },
        ),
        verticalSpace(12),
        LanguageDropDown(
          hint: 'To Language',
          borderColor: AppColors.grey,
          hintColor: AppColors.darkGrey,
          items: widget.companyModel.preferredLanguages,
          value: widget.projectModel.languageTo,
          isEditable: widget.projectModel.status.value == 0,
          onChanged: (value) {
            context.read<ProjectCubit>().setProjectData(toLanguage: value);
          },
        ),
      ],
    );
  }
}

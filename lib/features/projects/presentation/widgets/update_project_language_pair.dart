import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/utils/models/language_model.dart';
import '../../../auth/presentation/widgets/language_drop_down.dart';
import '../../../company/company_profile/data/model/company_model.dart';
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
  LanguageModel? fromLanguage, toLanguage;
  @override
  void initState() {
    fromLanguage = getLanguagebyId(
      widget.companyModel.preferredLanguages,
      widget.projectModel.languageFromId,
    );
    toLanguage = getLanguagebyId(
      widget.companyModel.preferredLanguages,
      widget.projectModel.languageToId,
    );
    context.read<ProjectCubit>().setCreateProjectData(
          fromLanguage: fromLanguage,
          toLanguage: toLanguage,
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
          isEditable: widget.projectModel.status == 0,
          value: fromLanguage,
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
          items: widget.companyModel.preferredLanguages,
          value: toLanguage,
          isEditable: widget.projectModel.status == 0,
          onChanged: (value) {
            context
                .read<ProjectCubit>()
                .setCreateProjectData(toLanguage: value);
          },
        ),
      ],
    );
  }

  LanguageModel? getLanguagebyId(
      List<LanguageModel> languages, int? languageId) {
    return languages.firstWhere((element) => element.id == languageId);
  }
}

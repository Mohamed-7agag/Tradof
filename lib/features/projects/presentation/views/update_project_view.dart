import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_style.dart';
import '../../../company/company_profile/data/model/company_model.dart';
import '../logic/file_cubit.dart';
import '../widgets/attachment_files_section.dart';
import '../widgets/create_project_industries_section.dart';
import '../widgets/project_text_field.dart';
import '../widgets/select_date_section.dart';
import '../widgets/update_project_app_bar.dart';
import '../widgets/update_project_button.dart';
import '../widgets/update_project_language_pair.dart';

class UpdateProjectView extends StatefulWidget {
  const UpdateProjectView({
    super.key,
    required this.companyModel,
  });
  final CompanyModel companyModel;
  @override
  State<UpdateProjectView> createState() => _UpdateProjectViewState();
}

class _UpdateProjectViewState extends State<UpdateProjectView> {
  late final TextEditingController projectNameController;
  late final TextEditingController projectDescriptionController;
  late final TextEditingController minBudgetController;
  late final TextEditingController maxBudgetController;

  @override
  void initState() {
    projectNameController = TextEditingController();
    projectDescriptionController = TextEditingController();
    minBudgetController = TextEditingController();
    maxBudgetController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    projectNameController.dispose();
    projectDescriptionController.dispose();
    minBudgetController.dispose();
    maxBudgetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FileCubit()..addFiles([]),
      child: Column(
        children: [
          UpdateProjectAppbar(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(20),
                    ProjectTextField(
                      labelText: 'Project Name',
                      controller: projectNameController,
                    ),
                    verticalSpace(22),
                    ProjectTextField(
                      labelText: 'Project Description',
                      controller: projectDescriptionController,
                      maxLines: 4,
                    ),
                    verticalSpace(22),
                    Text('Language Pair', style: AppStyle.poppinsMedium14),
                    verticalSpace(12),
                    UpdateProjectLanguagePair(),
                    verticalSpace(30),
                    CreateProjectIndustriesSection(
                      companyModel: widget.companyModel,
                    ),
                    verticalSpace(30),
                    Row(
                      children: [
                        Expanded(
                          child: ProjectTextField(
                            labelText: 'Min Budget',
                            controller: minBudgetController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        horizontalSpace(10),
                        Expanded(
                          child: ProjectTextField(
                            labelText: 'Max Budget',
                            controller: maxBudgetController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(20),
                    Text('Delivery Date', style: AppStyle.poppinsMedium14),
                    verticalSpace(12),
                    SelectDateSection(),
                    verticalSpace(20),
                    Text(
                      'Attachments Files',
                      style: AppStyle.poppinsMedium14,
                    ),
                    verticalSpace(12),
                    AttachmentFilesSection(),
                    verticalSpace(60),
                    UpdateProjectButton(
                      projectNameController: projectNameController,
                      projectDescriptionController:
                          projectDescriptionController,
                      minBudgetController: minBudgetController,
                      maxBudgetController: maxBudgetController,
                    ),
                    verticalSpace(40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

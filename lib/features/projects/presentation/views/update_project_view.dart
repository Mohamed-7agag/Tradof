import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/features/projects/data/models/project_model.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_style.dart';
import '../../../company/company_profile/data/model/company_model.dart';
import '../logic/file_cubit.dart';
import '../widgets/attachment_files_section.dart';
import '../widgets/create_project_industries_section.dart';
import '../widgets/project_text_field.dart';
import '../widgets/update_project_app_bar.dart';
import '../widgets/update_project_button.dart';
import '../widgets/update_project_language_pair.dart';

class UpdateProjectView extends StatefulWidget {
  const UpdateProjectView({
    super.key,
    required this.companyModel,
    required this.projectModel,
  });
  final CompanyModel companyModel;
  final ProjectModel projectModel;
  @override
  State<UpdateProjectView> createState() => _UpdateProjectViewState();
}

class _UpdateProjectViewState extends State<UpdateProjectView> {
  late final TextEditingController projectNameController;
  late final TextEditingController projectDescriptionController;
  late final TextEditingController minBudgetController;
  late final TextEditingController maxBudgetController;
  late final TextEditingController daysController;

  @override
  void initState() {
    projectNameController =
        TextEditingController(text: widget.projectModel.projectName);
    projectDescriptionController =
        TextEditingController(text: widget.projectModel.description);
    minBudgetController =
        TextEditingController(text: widget.projectModel.minPrice.toString());
    maxBudgetController =
        TextEditingController(text: widget.projectModel.maxPrice.toString());
    daysController =
        TextEditingController(text: widget.projectModel.days.toString());
    super.initState();
  }

  @override
  void dispose() {
    projectNameController.dispose();
    projectDescriptionController.dispose();
    minBudgetController.dispose();
    maxBudgetController.dispose();
    daysController.dispose();
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
                    verticalSpace(25),
                    ProjectTextField(
                      labelText: 'Project Description',
                      controller: projectDescriptionController,
                      maxLines: 4,
                    ),
                    verticalSpace(25),
                    Text('Language Pair', style: AppStyle.poppinsMedium14),
                    verticalSpace(12),
                    UpdateProjectLanguagePair(),
                    verticalSpace(30),
                    CreateProjectIndustriesSection(
                      companyModel: widget.companyModel,
                    ),
                    verticalSpace(25),
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
                    verticalSpace(25),
                    ProjectTextField(
                      labelText: 'Delivery Time (Days)',
                      controller: daysController,
                      keyboardType: TextInputType.number,
                    ),
                    verticalSpace(25),
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
                      daysController: daysController,
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

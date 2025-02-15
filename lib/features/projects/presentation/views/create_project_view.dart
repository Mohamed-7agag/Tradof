import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tradof/core/helpers/spacing.dart';

import '../../../../core/theming/app_style.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../company/company_profile/data/model/company_model.dart';
import '../logic/file_cubit.dart';
import '../widgets/attachment_files_section.dart';
import '../widgets/create_project_button.dart';
import '../widgets/create_project_industries_section.dart';
import '../widgets/create_project_language_pair.dart';
import '../widgets/project_text_field.dart';

class CreateProjectView extends StatefulWidget {
  const CreateProjectView({super.key, required this.companyModel});
  final CompanyModel companyModel;
  @override
  State<CreateProjectView> createState() => _CreateProjectViewState();
}

class _CreateProjectViewState extends State<CreateProjectView> {
  late final TextEditingController projectNameController;
  late final TextEditingController projectDescriptionController;
  late final TextEditingController minBudgetController;
  late final TextEditingController maxBudgetController;
  late final TextEditingController daysController;

  @override
  void initState() {
    projectNameController = TextEditingController();
    projectDescriptionController = TextEditingController();
    minBudgetController = TextEditingController();
    maxBudgetController = TextEditingController();
    daysController = TextEditingController();
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
      create: (context) => FileCubit(),
      child: Column(
        children: [
          customAppbar(
            title: 'Create Project',
            actionIcon: HugeIcons.strokeRoundedPenToolAdd,
          ),
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
                    verticalSpace(20),
                    Text('Language Pair', style: AppStyle.poppinsMedium14),
                    verticalSpace(12),
                    CreateProjectLanguagePair(
                      companyModel: widget.companyModel,
                    ),
                    verticalSpace(25),
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
                    CreateProjectButton(
                      projectNameController: projectNameController,
                      projectDescriptionController:
                          projectDescriptionController,
                      minBudgetController: minBudgetController,
                      maxBudgetController: maxBudgetController,
                      daysController: daysController,
                    ),
                    verticalSpace(100),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/features/projects/presentation/logic/file_cubit.dart';
import 'package:tradof/features/projects/presentation/widgets/attachment_files_section.dart';
import 'package:tradof/features/projects/presentation/widgets/create_project_button.dart';
import 'package:tradof/features/projects/presentation/widgets/create_project_language_pair.dart';
import 'package:tradof/features/projects/presentation/widgets/project_text_field.dart';

import '../../../../core/theming/app_style.dart';
import '../widgets/create_project_app_bar.dart';
import '../widgets/select_date_section.dart';

class CreateProjectView extends StatefulWidget {
  const CreateProjectView({super.key});

  @override
  State<CreateProjectView> createState() => _CreateProjectViewState();
}

class _CreateProjectViewState extends State<CreateProjectView> {
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
      create: (context) => FileCubit(),
      child: Column(
        children: [
          CreateProjectAppbar(),
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
                    CreateProjectLanguagePair(),
                    verticalSpace(40),
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
                    Text('Attachments Files', style: AppStyle.poppinsMedium14),
                    verticalSpace(12),
                    AttachmentFilesSection(),
                    verticalSpace(60),
                    CreateProjectButton(
                      projectNameController: projectNameController,
                      projectDescriptionController:
                          projectDescriptionController,
                      minBudgetController: minBudgetController,
                      maxBudgetController: maxBudgetController,
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

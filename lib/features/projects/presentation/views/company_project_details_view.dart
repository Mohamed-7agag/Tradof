import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_style.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../../../profile/company_profile/data/model/company_model.dart';
import '../../data/models/file_model.dart';
import '../../data/models/project_model.dart';
import '../logic/file_cubit.dart';
import '../logic/project_cubit/project_cubit.dart';
import '../logic/project_cubit/project_extenstion.dart';
import '../widgets/attachment_files_section.dart';
import '../widgets/create_project_industries_section.dart';
import '../widgets/project_header_section.dart';
import '../widgets/project_text_field.dart';
import '../widgets/update_project_button.dart';
import '../widgets/update_project_language_pair.dart';

class CompanyProjectDetailsView extends StatefulWidget {
  const CompanyProjectDetailsView({
    required this.companyModel,
    required this.projectModel,
    super.key,
  });
  final CompanyModel companyModel;
  final ProjectModel projectModel;
  @override
  State<CompanyProjectDetailsView> createState() =>
      _CompanyProjectDetailsViewState();
}

class _CompanyProjectDetailsViewState extends State<CompanyProjectDetailsView> {
  late final TextEditingController projectNameController;
  late final TextEditingController projectDescriptionController;
  late final TextEditingController minBudgetController;
  late final TextEditingController maxBudgetController;
  late final TextEditingController daysController;
  late List<FileModel> _originalFiles; // Store original files

  @override
  void initState() {
    projectNameController =
        TextEditingController(text: widget.projectModel.name);
    projectDescriptionController =
        TextEditingController(text: widget.projectModel.description);
    minBudgetController =
        TextEditingController(text: widget.projectModel.minPrice.toString());
    maxBudgetController =
        TextEditingController(text: widget.projectModel.maxPrice.toString());
    daysController =
        TextEditingController(text: widget.projectModel.days.toString());

    // Store original files and set them in the cubit
    _originalFiles = List.from(widget.projectModel.files);
    context.read<ProjectCubit>().filesProjectList = List.from(_originalFiles);

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
      child: Scaffold(
        appBar: customAppbar(
          title: 'Project Details',
          actionIcon: HugeIcons.strokeRoundedDashboardCircleSettings,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(14),
                ProjectHeaderSection(
                  projectId: widget.projectModel.id,
                  offersCount: widget.projectModel.numberOfOffers,
                ),
                verticalSpace(35),
                ProjectTextField(
                  labelText: 'Project Name',
                  controller: projectNameController,
                  readOnly: widget.projectModel.status.value != 0,
                ),
                verticalSpace(25),
                ProjectTextField(
                  labelText: 'Project Description',
                  controller: projectDescriptionController,
                  readOnly: widget.projectModel.status.value != 0,
                  maxLines: 4,
                ),
                verticalSpace(25),
                Text('Language Pair', style: AppStyle.poppinsMedium14),
                verticalSpace(12),
                UpdateProjectLanguagePair(
                  companyModel: widget.companyModel,
                  projectModel: widget.projectModel,
                ),
                verticalSpace(30),
                CreateProjectIndustriesSection(
                  companyModel: widget.companyModel,
                  value: widget.projectModel.specialization,
                  isEditable: widget.projectModel.status.value == 0,
                ),
                verticalSpace(25),
                Row(
                  children: [
                    Expanded(
                      child: ProjectTextField(
                        labelText: 'Min Budget',
                        controller: minBudgetController,
                        keyboardType: TextInputType.number,
                        readOnly: widget.projectModel.status.value != 0,
                      ),
                    ),
                    horizontalSpace(10),
                    Expanded(
                      child: ProjectTextField(
                        labelText: 'Max Budget',
                        controller: maxBudgetController,
                        keyboardType: TextInputType.number,
                        readOnly: widget.projectModel.status.value != 0,
                      ),
                    ),
                  ],
                ),
                verticalSpace(25),
                ProjectTextField(
                  labelText: 'Delivery Time (Days)',
                  controller: daysController,
                  keyboardType: TextInputType.number,
                  readOnly: widget.projectModel.status.value != 0,
                ),
                verticalSpace(25),
                Text(
                  'Attachments Files',
                  style: AppStyle.poppinsMedium14,
                ),
                verticalSpace(12),
                BlocBuilder<ProjectCubit, ProjectState>(
                  buildWhen: (previous, current) =>
                      current.status.isRemoveFilefromList,
                  builder: (context, state) {
                    final cubit = context.read<ProjectCubit>();
                    return AttachmentFilesSection(
                      key: ValueKey('files_${cubit.filesProjectList.length}'),
                      filesList: cubit.filesProjectList,
                      onDeleteFile: (int fileId) {
                        setState(() {
                          cubit.removeFile(fileId);
                        });
                      },
                    );
                  },
                ),
                verticalSpace(60),
                UpdateProjectButton(
                  projectNameController: projectNameController,
                  projectDescriptionController: projectDescriptionController,
                  minBudgetController: minBudgetController,
                  maxBudgetController: maxBudgetController,
                  daysController: daysController,
                  projectModel: widget.projectModel,
                ),
                verticalSpace(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

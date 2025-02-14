import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/utils/widgets/custom_toastification.dart';
import 'package:tradof/features/projects/presentation/logic/file_cubit.dart';

import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../logic/project_cubit/project_cubit.dart';

class CreateProjectButton extends StatelessWidget {
  const CreateProjectButton({
    super.key,
    required this.projectNameController,
    required this.projectDescriptionController,
    required this.minBudgetController,
    required this.maxBudgetController,
    required this.daysController,
  });
  final TextEditingController projectNameController;
  final TextEditingController projectDescriptionController;
  final TextEditingController minBudgetController;
  final TextEditingController maxBudgetController;
  final TextEditingController daysController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProjectCubit, ProjectState>(
      listenWhen: _listenAndBuildWhen,
      buildWhen: _listenAndBuildWhen,
      listener: (context, state) {
        if (state.status == ProjectStatus.createProjectSuccess) {
          successToast(context, 'Success', state.message);
          _resetData(context);
        } else if (state.status == ProjectStatus.createProjectFailure) {
          errorToast(context, 'Error', state.errorMessage);
        }
      },
      builder: (context, state) {
        return state.status == ProjectStatus.createProjectLoading
            ? const CustomLoadingWidget()
            : CustomButton(
                text: 'Create Project',
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  _validateAndCreateProject(context);
                },
              );
      },
    );
  }

  bool _listenAndBuildWhen(previous, current) {
    return current.status.isCreateProjectSuccess ||
        current.status.isCreateProjectFailure ||
        current.status.isCreateProjectLoading;
  }

  void _resetData(BuildContext context) {
    projectNameController.clear();
    projectDescriptionController.clear();
    minBudgetController.clear();
    maxBudgetController.clear();
    context.read<FileCubit>().resetFiles();
  }

  void _validateAndCreateProject(BuildContext context) {
    final files = context.read<FileCubit>().getFiles();
    final projectName = projectNameController.text.trim();
    final projectDescription = projectDescriptionController.text.trim();
    final days = daysController.text.trim() == ''
        ? 0
        : int.parse(daysController.text.trim());
    final minBudget = minBudgetController.text.trim() == ''
        ? 0
        : int.parse(minBudgetController.text.trim());
    final maxBudget = maxBudgetController.text.trim() == ''
        ? 0
        : int.parse(maxBudgetController.text.trim());

    if (projectName.isEmpty ||
        projectDescription.isEmpty ||
        minBudgetController.text.isEmpty ||
        maxBudgetController.text.isEmpty ||
        daysController.text.isEmpty) {
      errorToast(context, 'Error', 'Please fill in all fields');
    } else if (minBudget > maxBudget) {
      errorToast(
          context, 'Error', 'Min budget cannot be greater than max budget');
    } else if (context.read<ProjectCubit>().state.fromLanguage == null ||
        context.read<ProjectCubit>().state.toLanguage == null) {
      errorToast(context, 'Error', 'Please select a language pair');
    } else if (context.read<ProjectCubit>().state.fromLanguage ==
        context.read<ProjectCubit>().state.toLanguage) {
      errorToast(context, 'Error', 'Please select different languages');
    } else if (context.read<ProjectCubit>().state.industryId == null) {
      errorToast(context, 'Error', 'Please select an industry Served');
    } else if (files.isEmpty) {
      errorToast(context, 'Error', 'Please select at least one file');
    } else {
      context.read<ProjectCubit>().createProject(
            projectName,
            projectDescription,
            minBudget,
            maxBudget,
            days,
            files,
          );
    }
  }
}

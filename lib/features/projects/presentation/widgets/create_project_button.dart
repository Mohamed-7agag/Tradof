import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/utils/widgets/custom_toastification.dart';
import 'package:tradof/features/projects/presentation/logic/file_cubit.dart';

import '../../../../core/utils/widgets/custom_button.dart';
import '../logic/project_cubit/project_cubit.dart';

class CreateProjectButton extends StatelessWidget {
  const CreateProjectButton({
    super.key,
    required this.projectNameController,
    required this.projectDescriptionController,
    required this.minBudgetController,
    required this.maxBudgetController,
  });
  final TextEditingController projectNameController;
  final TextEditingController projectDescriptionController;
  final TextEditingController minBudgetController;
  final TextEditingController maxBudgetController;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Create Project',
      onPressed: () {
        FocusManager.instance.primaryFocus?.unfocus();
        _validateAndCreateProject(context);
      },
    );
  }

  void _validateAndCreateProject(BuildContext context) {
    final files = context.read<FileCubit>().getFiles();
    final projectName = projectNameController.text.trim();
    final projectDescription = projectDescriptionController.text.trim();
    final minBudget = minBudgetController.text.trim() == ''
        ? 0
        : int.parse(minBudgetController.text.trim());
    final maxBudget = maxBudgetController.text.trim() == ''
        ? 0
        : int.parse(maxBudgetController.text.trim());

    if (projectName.isEmpty ||
        projectDescription.isEmpty ||
        minBudgetController.text.isEmpty ||
        maxBudgetController.text.isEmpty) {
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
    } else if (context.read<ProjectCubit>().state.projectDeliveryDate == null) {
      errorToast(context, 'Error', 'Please select a delivery date');
    } else if (files.isEmpty) {
      errorToast(context, 'Error', 'Please select at least one file');
    } else {
      // context.read<ProjectCubit>().createProject(
      //       projectName,
      //       projectDescription,
      //       minBudget,
      //       maxBudget,
      //       files,
      //     );
    }
  }
}

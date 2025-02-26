import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../../data/models/project_model.dart';
import '../logic/file_cubit.dart';
import '../logic/project_cubit/project_cubit.dart';

class UpdateProjectButton extends StatelessWidget {
  const UpdateProjectButton({
    required this.projectNameController,
    required this.projectDescriptionController,
    required this.minBudgetController,
    required this.maxBudgetController,
    required this.daysController,
    required this.projectModel,
    super.key,
  });
  final TextEditingController projectNameController;
  final TextEditingController projectDescriptionController;
  final TextEditingController minBudgetController;
  final TextEditingController maxBudgetController;
  final TextEditingController daysController;
  final ProjectModel projectModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProjectCubit, ProjectState>(
      listenWhen: (previous, current) => _listenAndBuildWhen(current),
      buildWhen: (previous, current) => _listenAndBuildWhen(current),
      listener: (context, state) {
        if (state.status.isUpdateProjectSuccess) {
          successToast(context, 'Success', state.message);
          context.pop(result: true);
        } else if (state.status.isUpdateProjectFailure) {
          errorToast(context, 'Error', state.errorMessage);
        }
      },
      builder: (context, state) {
        return state.status.isUpdateProjectLoading
            ? const CustomLoadingWidget()
            : CustomButton(
                text: 'Update Project',
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  _validateAndUpdateProject(context, state);
                },
              );
      },
    );
  }

  bool _listenAndBuildWhen(ProjectState current) {
    return current.status.isUpdateProjectFailure ||
        current.status.isUpdateProjectSuccess ||
        current.status.isUpdateProjectLoading;
  }

  void _validateAndUpdateProject(BuildContext context, ProjectState state) {
    log(context.read<ProjectCubit>().state.fromLanguage.toString());
    log(context.read<ProjectCubit>().state.toLanguage.toString());

    final days = daysController.text.trim() == ''
        ? 0
        : int.parse(daysController.text.trim());
    final minBudget = minBudgetController.text.trim() == ''
        ? 0
        : int.parse(minBudgetController.text.trim());
    final maxBudget = maxBudgetController.text.trim() == ''
        ? 0
        : int.parse(maxBudgetController.text.trim());

    if (minBudget > maxBudget) {
      errorToast(
          context, 'Error', 'Min budget cannot be greater than Max budget');
    } else if (context.read<ProjectCubit>().state.fromLanguage ==
        context.read<ProjectCubit>().state.toLanguage) {
      errorToast(context, 'Error', 'Please select different languages');
    } else {
      context.read<ProjectCubit>().updateProject(
            projectModel,
            projectName: projectNameController.text.trim(),
            projectDescription: projectDescriptionController.text.trim(),
            minBudget: minBudget,
            maxBudget: maxBudget,
            days: days,
            files: context.read<FileCubit>().getFiles(),
          );
    }
  }
}

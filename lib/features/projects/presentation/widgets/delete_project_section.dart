import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/core/utils/widgets/custom_loading_dialog.dart';

import '../../../../core/utils/widgets/custom_toastification.dart';
import '../logic/project_cubit/project_cubit.dart';

class DeleteProjectSection extends StatelessWidget {
  const DeleteProjectSection({required this.projectId, super.key});
  final int projectId;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectCubit, ProjectState>(
      listenWhen: (previous, current) => _listenAndBuildWhen(current),
      listener: (context, state) {
        if (state.status.isDeleteProjectSuccess) {
          context.pop();
          successToast(context, 'Success', state.message);
          context.pop();
        } else if (state.status.isDeleteProjectFailure) {
          context.pop();
          errorToast(context, 'Error', state.message);
        } else if (state.status.isDeleteProjectLoading) {
          loadingDialog(context);
        }
      },
      child: InkWell(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
          _showDeleteDialog(context, projectId);
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.red.withValues(alpha: 0.15),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Delete Project',
              style: AppStyle.poppinsSemiBold14.copyWith(color: Colors.red),
            ),
            const HugeIcon(
                icon: HugeIcons.strokeRoundedDelete02, color: Colors.red)
          ]),
        ),
      ),
    );
  }

  bool _listenAndBuildWhen(ProjectState state) {
    return state.status.isDeleteProjectSuccess ||
        state.status.isDeleteProjectFailure ||
        state.status.isDeleteProjectLoading;
  }

  void _showDeleteDialog(BuildContext context, int projectId) {
    AwesomeDialog(
        context: context,
        animType: AnimType.rightSlide,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        dialogType: DialogType.question,
        body: Text(
          'Are you sure you want to delete this project ?',
          textAlign: TextAlign.center,
          style: AppStyle.robotoRegular14.copyWith(height: 1.8),
        ),
        btnCancelOnPress: () {},
        btnOkOnPress: () {
          context.read<ProjectCubit>().deleteProject(projectId);
        }).show();
  }
}

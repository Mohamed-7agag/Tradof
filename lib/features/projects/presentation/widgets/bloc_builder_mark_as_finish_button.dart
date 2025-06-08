import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/custom_url_launcher.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../../data/models/pay_project_request_model.dart';
import '../../data/models/project_model.dart';
import '../logic/project_cubit/project_cubit.dart';

class BlocBuilderMarkAsFinishButton extends StatelessWidget {
  const BlocBuilderMarkAsFinishButton({
    required this.projectModel,
    super.key,
  });

  final ProjectModel projectModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProjectCubit, ProjectState>(
      listenWhen: _buildWhen,
      listener: (context, state) {
        if (state.status == ProjectStatus.markAsFinishedSuccess) {
          successToast(context, 'Success', state.message);
          context.read<ProjectCubit>().getCurrentProjects();
        } else if (state.status == ProjectStatus.markAsFinishedFailure) {
          errorToast(context, 'Error', state.errorMessage);
        }
        if (state.status == ProjectStatus.payProjectSuccess) {
          customUrlLauncher(context, state.payProjectResponse?.iframURL ?? '');
          context.read<ProjectCubit>().getPaymentStatus(projectModel.id);
          //successToast(context, 'Success', state.message);
        } else if (state.status == ProjectStatus.payProjectFailure) {
          errorToast(context, 'Error', state.errorMessage);
        }
      },
      buildWhen: (previous, current) =>
          current.status == ProjectStatus.markAsFinishedLoading ||
          current.status == ProjectStatus.markAsFinishedSuccess ||
          current.status == ProjectStatus.markAsFinishedFailure ||
          current.status == ProjectStatus.payProjectLoading ||
          current.status == ProjectStatus.payProjectSuccess ||
          current.status == ProjectStatus.payProjectFailure,
      builder: (context, state) {
        return state.status == ProjectStatus.markAsFinishedLoading ||
                state.status == ProjectStatus.getPaymentStatusLoading ||
                state.status == ProjectStatus.payProjectLoading
            ? const CustomLoadingWidget()
            : state.paymentStatus
                ? CustomButton(
                    text: 'Finish',
                    color: AppColors.lightOrange,
                    width: 0.6,
                    onPressed: () {
                      context.read<ProjectCubit>().markProjectAsFinished(
                            projectModel.id,
                          );
                    },
                  )
                : CustomButton(
                    text: 'Pay',
                    color: AppColors.lightOrange,
                    width: 0.6,
                    onPressed: () {
                      context.read<ProjectCubit>().payProject(
                            PayProjectRequestModel(
                              projectId: projectModel.id,
                              freelancerId: projectModel.freelancerId,
                              budget: projectModel.price,
                              deliveryTime: projectModel.days.toString(),
                            ),
                          );
                    },
                  );
      },
    );
  }

  bool _buildWhen(previous, current) =>
      current.status == ProjectStatus.markAsFinishedLoading ||
      current.status == ProjectStatus.markAsFinishedSuccess ||
      current.status == ProjectStatus.markAsFinishedFailure ||
      current.status == ProjectStatus.payProjectLoading ||
      current.status == ProjectStatus.payProjectSuccess ||
      current.status == ProjectStatus.payProjectFailure ||
      current.status == ProjectStatus.getPaymentStatusLoading ||
      current.status == ProjectStatus.getPaymentStatusSuccess ||
      current.status == ProjectStatus.getPaymentStatusFailure;
}

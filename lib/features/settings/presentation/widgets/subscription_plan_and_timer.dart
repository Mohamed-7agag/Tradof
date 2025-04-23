import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/utils/widgets/custom_failure_widget.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../logic/miscellaneous_cubit/miscellaneous_cubit.dart';
import 'subscription_plan.dart';
import 'timer.dart';

class SubscriptionPlanAndTimer extends StatelessWidget {
  const SubscriptionPlanAndTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MiscellaneousCubit, MiscellaneousState>(
      buildWhen: (previous, current) => _buildWhen(current),
      builder: (context, state) {
        if (state.status.isGetSubscriptionPlanSuccess) {
          return IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: SlideInLeft(
                    from: 400,
                    delay: const Duration(milliseconds: 360),
                    child: Subscriptionplan(
                        subscription: state.subscriptionModel!),
                  ),
                ),
                horizontalSpace(10),
                Expanded(
                  flex: 3,
                  child: SlideInRight(
                    from: 400,
                    delay: const Duration(milliseconds: 360),
                    child: TimerOFdays(subscription: state.subscriptionModel!),
                  ),
                ),
              ],
            ),
          );
        } else if (state.status.isGetSubscriptionPlanFailure) {
          return CustomFailureWithContainer(text: state.errMessage);
        }
        return const CustomLoadingWidget();
      },
    );
  }

  bool _buildWhen(MiscellaneousState state) {
    return state.status.isGetSubscriptionPlanSuccess ||
        state.status.isGetSubscriptionPlanFailure ||
        state.status.isGetSubscriptionPlanLoading;
  }
}

class CustomFailureWithContainer extends StatelessWidget {
  const CustomFailureWithContainer({required this.text, super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: CustomFailureWidget(text: text),
    );
  }
}

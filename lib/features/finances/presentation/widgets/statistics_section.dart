import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../../../core/utils/widgets/custom_failure_widget.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../logic/cubit/finances_cubit.dart';

class StatisticsSection extends StatelessWidget {
  const StatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FinancesCubit, FinancesState>(
      buildWhen: _buildWhen,
      builder: (context, state) {
        return state.status.isGetStatisticsSuccess
            ? StatisticsContent(state: state)
            : state.status.isGetStatisticsFailure
                ? FailureWidget(errorMessage: state.errorMessage)
                : const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: CustomLoadingWidget(),
                  );
      },
    );
  }

  bool _buildWhen(FinancesState previous, FinancesState current) {
    return current.status.isGetStatisticsFailure ||
        current.status.isGetStatisticsLoading ||
        current.status.isGetStatisticsSuccess;
  }
}

class StatisticsContent extends StatelessWidget {
  final FinancesState state;

  const StatisticsContent({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: AppColors.cardDarkColor,
          thickness: 1,
          endIndent: 50,
          indent: 50,
          height: 50,
        ),
        TotalBalanceCard(state: state),
        verticalSpace(16),
        BalanceRow(state: state),
      ],
    );
  }
}

class TotalBalanceCard extends StatelessWidget {
  final FinancesState state;

  const TotalBalanceCard({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: BalanceRow2(
        title: 'Total Balance',
        amount: state.statisticsModel?.totalBalance,
      ),
    );
  }
}

class BalanceRow extends StatelessWidget {
  final FinancesState state;

  const BalanceRow({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BalanceCard(
            title: 'Available Balance',
            amount: state.statisticsModel?.previousBalance,
            onTap: () => context.pushNamed(Routes.withdrawProfitViewRoute,
                arguments:
                    state.statisticsModel?.previousBalance.toDouble() ?? 0.0),
          ),
        ),
        horizontalSpace(10),
        Expanded(
          child: BalanceCard(
            title: 'Pending Balance',
            amount: state.statisticsModel?.pendingBalance.abs(),
          ),
        ),
      ],
    );
  }
}

class BalanceCard extends StatelessWidget {
  final String title;
  final num? amount;
  final void Function()? onTap;

  const BalanceCard({
    required this.title,
    required this.amount,
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppStyle.robotoCondensedMedium12),
            verticalSpace(6),
            Text('$amount EGP', style: AppStyle.poppinsMedium15),
          ],
        ),
      ),
    );
  }
}

class BalanceRow2 extends StatelessWidget {
  final String title;
  final num? amount;

  const BalanceRow2({
    required this.title,
    required this.amount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyle.poppinsMedium15.copyWith(color: AppColors.white),
        ),
        Text(
          '$amount EGP',
          style: AppStyle.poppinsMedium15.copyWith(color: AppColors.white),
        ),
      ],
    );
  }
}

class FailureWidget extends StatelessWidget {
  final String errorMessage;

  const FailureWidget({required this.errorMessage, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFailureWidget(
      text: errorMessage,
      onRetry: () => context.read<FinancesCubit>().getStatistics(),
    );
  }
}

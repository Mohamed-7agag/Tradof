import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
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
            ? _buildStatisticsContent(state)
            : state.status.isGetStatisticsFailure
                ? _buildFailureWidget(context, state.errorMessage)
                : const CustomLoadingWidget();
      },
    );
  }

  Widget _buildStatisticsContent(FinancesState state) {
    return Column(
      children: [
        verticalSpace(15),
        _buildTotalBalanceCard(state),
        verticalSpace(16),
        _buildBalanceRow(state),
      ],
    );
  }

  Widget _buildTotalBalanceCard(FinancesState state) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: _buildBalanceRow2(
          'Total Balance', state.statisticsModel?.totalBalance),
    );
  }

  Widget _buildBalanceRow(FinancesState state) {
    return Row(
      children: [
        Expanded(
          child: _buildBalanceCard(
            'Available Balance',
            state.statisticsModel?.previousBalance,
          ),
        ),
        horizontalSpace(10),
        Expanded(
          child: _buildBalanceCard(
            'Pending Balance',
            state.statisticsModel?.pendingBalance,
          ),
        ),
      ],
    );
  }

  Widget _buildBalanceCard(String title, num? amount) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppStyle.robotoCondensedMedium12),
          verticalSpace(6),
          Text('$amount \$', style: AppStyle.poppinsMedium15),
        ],
      ),
    );
  }

  Widget _buildBalanceRow2(String title, num? amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyle.poppinsMedium15.copyWith(color: AppColors.white),
        ),
        Text(
          '$amount \$',
          style: AppStyle.poppinsMedium15.copyWith(color: AppColors.white),
        ),
      ],
    );
  }

  Widget _buildFailureWidget(BuildContext context, String errorMessage) {
    return CustomFailureWidget(
      text: errorMessage,
      onRetry: () => context.read<FinancesCubit>().getStatistics(),
    );
  }

  bool _buildWhen(FinancesState previous, FinancesState current) {
    return current.status.isGetStatisticsFailure ||
        current.status.isGetStatisticsLoading ||
        current.status.isGetStatisticsSuccess;
  }
}

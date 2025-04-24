import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/widgets/custom_failure_widget.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../logic/cubit/finances_cubit.dart';
import 'finance_project_item.dart';

class FinanceProjectsView extends StatefulWidget {
  const FinanceProjectsView({required this.isCompany, super.key});
  final bool isCompany;

  @override
  State<FinanceProjectsView> createState() => _FinanceProjectsViewState();
}

class _FinanceProjectsViewState extends State<FinanceProjectsView> {
  @override
  void initState() {
    if (context.read<FinancesCubit>().state.financeProjects.isEmpty) {
      context
          .read<FinancesCubit>()
          .getFinanceProjects(isCompany: widget.isCompany);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocBuilder<FinancesCubit, FinancesState>(
        buildWhen: (previous, current) => _buildWhen(current),
        builder: (context, state) {
          if (state.status.isGetFinanceProjectSuccess) {
            return ListView.builder(
              itemCount: state.financeProjects.length,
              padding: const EdgeInsets.only(top: 45, bottom: 100),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return FinanceProjectItem(
                  project: state.financeProjects[index],
                );
              },
            );
          } else if (state.status.isGetFinanceProjectFailure) {
            return CustomFailureWidget(
              text: state.errorMessage,
              onRetry: () => context
                  .read<FinancesCubit>()
                  .getFinanceProjects(isCompany: widget.isCompany),
            );
          }
          return const CustomLoadingWidget();
        },
      ),
    );
  }

  bool _buildWhen(FinancesState state) {
    return state.status.isGetFinanceProjectLoading ||
        state.status.isGetFinanceProjectSuccess ||
        state.status.isGetFinanceProjectFailure;
  }
}

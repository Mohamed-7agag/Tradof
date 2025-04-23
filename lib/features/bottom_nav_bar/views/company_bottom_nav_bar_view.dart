// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';

import '../../../core/di/di.dart';
import '../../../core/helpers/exit_dialog.dart';
import '../../../core/utils/widgets/custom_failure_widget.dart';
import '../../../core/utils/widgets/custom_loading_widget.dart';
import '../../dashboard/company_dashboard/presentation/views/company_dashboard_view.dart';
import '../../finances/presentation/logic/cubit/finances_cubit.dart';
import '../../finances/presentation/views/company_finance_view.dart';
import '../../profile/company_profile/presentation/logic/company_profile_cubit/company_profile_cubit.dart';
import '../../profile/company_profile/presentation/views/company_profile_view.dart';
import '../../projects/presentation/views/create_project_view.dart';
import '../../settings/presentation/logic/miscellaneous_cubit/miscellaneous_cubit.dart';
import '../../settings/presentation/views/company_setting_view.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class CompanyBottomNavBarView extends StatefulWidget {
  const CompanyBottomNavBarView({super.key});

  @override
  State<CompanyBottomNavBarView> createState() =>
      _CompanyBottomNavBarViewState();
}

class _CompanyBottomNavBarViewState extends State<CompanyBottomNavBarView> {
  int currentIndex = 0;

  List<Widget> _buildIndexedStackChildren(CompanyProfileState state) {
    return [
      CompanyDashboardView(companyModel: state.companyModel!),
      CreateProjectView(companyModel: state.companyModel!),
      CompanyProfileView(companyModel: state.companyModel!),
      BlocProvider(
        create: (context) => FinancesCubit(getIt())..getStatistics(),
        child: const CompanyFinanceView(),
      ),
      BlocProvider(
        create: (context) => MiscellaneousCubit(getIt())..getSubscription(),
        child: CompanySettingView(companyModel: state.companyModel!),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => exitDialog(context),
      child: Scaffold(
        body: BlocBuilder<CompanyProfileCubit, CompanyProfileState>(
          buildWhen: (previous, current) => _buildWhen(current),
          builder: (context, state) {
            if (state.status.isGetCompanySuccess) {
              return LazyLoadIndexedStack(
                index: currentIndex,
                children: _buildIndexedStackChildren(state),
              );
            } else if (state.status.isGetCompanyFailure) {
              return CustomFailureWidget(
                text: state.errorMessage,
                onRetry: () async {
                  context.read<CompanyProfileCubit>().getCompanyProfile();
                },
              );
            }
            return const CustomLoadingWidget();
          },
        ),
        bottomNavigationBar: CustomBottomNavBar(
          onTabTapped: (index) {
            setState(() => currentIndex = index);
          },
        ),
      ),
    );
  }
}

bool _buildWhen(CompanyProfileState current) {
  return current.status.isGetCompanySuccess ||
      current.status.isGetCompanyFailure ||
      current.status.isGetCompanyLoading;
}

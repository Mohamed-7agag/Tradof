// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/di/di.dart';
import '../../core/helpers/exit_dialog.dart';
import '../../core/utils/widgets/custom_animated_lazy_indexed_stack.dart';
import '../../core/utils/widgets/custom_bottom_nav_bar.dart';
import '../../core/utils/widgets/custom_failure_widget.dart';
import '../../core/utils/widgets/custom_loading_widget.dart';
import '../../core/utils/widgets/custom_refresh_indicator.dart';
import '../projects/presentation/logic/project_cubit/project_cubit.dart';
import '../projects/presentation/views/create_project_view.dart';
import 'company_dashboard/presentation/views/company_dashboard_view.dart';
import 'company_profile/presentation/logic/company_profile_cubit/company_profile_cubit.dart';
import 'company_profile/presentation/views/company_profile_view.dart';
import 'company_setting/presentation/views/company_setting_view.dart';

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
      BlocProvider(
        create: (context) => ProjectCubit(getIt()),
        child: CreateProjectView(companyModel: state.companyModel!),
      ),
      CompanyProfileView(companyModel: state.companyModel!),
      CompanyDashboardView(companyModel: state.companyModel!),
      CompanySettingView(companyModel: state.companyModel!),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => exitDialog(context),
      child: Scaffold(
        body: BlocBuilder<CompanyProfileCubit, CompanyProfileState>(
          buildWhen: (previous, current) =>
              current.status.isGetCompanySuccess ||
              current.status.isGetCompanyFailure ||
              current.status.isGetCompanyLoading,
          builder: (context, state) {
            if (state.status.isGetCompanySuccess) {
              return CustomAnimatedLazyIndexedStack(
                currentIndex: currentIndex,
                children: _buildIndexedStackChildren(state),
              );
            } else if (state.status.isGetCompanyFailure) {
              return _buildFailureWidget(
                context,
                currentIndex,
                state.errorMessage,
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

Widget _buildFailureWidget(
    BuildContext context, int currentIndex, String errorMessage) {
  if (currentIndex == 0) {
    return CustomRefreshIndicator(
      onRefresh: () async {
        context.read<CompanyProfileCubit>().getCompanyProfile();
      },
      child: ListView(
        itemExtent: 1.sh,
        children: [
          CustomFailureWidget(text: errorMessage),
        ],
      ),
    );
  } else {
    return CustomFailureWidget(text: errorMessage);
  }
}

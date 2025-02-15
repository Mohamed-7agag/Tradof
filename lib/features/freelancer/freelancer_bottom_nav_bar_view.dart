// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/exit_dialog.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/utils/widgets/bottom_nav_bar_center_icon.dart';
import 'package:tradof/core/utils/widgets/bottom_nav_bar_items.dart';
import 'package:tradof/core/utils/widgets/custom_failure_widget.dart';
import 'package:tradof/core/utils/widgets/custom_refresh_indicator.dart';
import 'package:tradof/features/freelancer/freelancer_setting/presentation/views/freelancer_setting_view.dart';

import '../../core/utils/widgets/bottom_nav_bar_clipper.dart';
import '../../core/utils/widgets/custom_animated_lazy_indexed_stack.dart';
import '../../core/utils/widgets/custom_loading_widget.dart';
import 'freelancer_dashboard/presentation/views/freelance_dashbord_view.dart';
import 'freelancer_profile/presentation/logic/freelancer_profile_cubit/freelancer_profile_cubit.dart';
import 'freelancer_profile/presentation/views/freelancer_profile_view.dart';

class FreelancerBottomNavBarView extends StatefulWidget {
  const FreelancerBottomNavBarView({super.key});

  @override
  State<FreelancerBottomNavBarView> createState() =>
      _FreelancerBottomNavBarViewState();
}

class _FreelancerBottomNavBarViewState
    extends State<FreelancerBottomNavBarView> {
  int currentIndex = 0;

  List<Widget> _buildIndexedStackChildren(FreelancerProfileState state) {
    return [
      FreelancerDashboardView(freelancerModel: state.freelancerModel!),
      FreelancerDashboardView(freelancerModel: state.freelancerModel!),
      FreelancerProfileView(freelancerModel: state.freelancerModel!),
      FreelancerDashboardView(freelancerModel: state.freelancerModel!),
      FreelancerSettingView(freelancerModel: state.freelancerModel!),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => exitDialog(context),
      child: Scaffold(
        body: BlocBuilder<FreelancerProfileCubit, FreelancerProfileState>(
          buildWhen: (previous, current) =>
              current.status.isGetFreelancerFailure ||
              current.status.isGetFreelancerSuccess ||
              current.status.isGetFreelancerLoading,
          builder: (context, state) {
            if (state.status.isGetFreelancerSuccess) {
              return CustomAnimatedLazyIndexedStack(
                currentIndex: currentIndex,
                children: _buildIndexedStackChildren(state),
              );
            } else if (state.status.isGetFreelancerFailure) {
              return _buildFailureWidget(
                context,
                currentIndex,
                state.errMessage,
              );
            }
            return const CustomLoadingWidget();
          },
        ),
        bottomNavigationBar: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            ClipPath(
              clipper: CustomNavBarClipper(),
              child: Container(
                height: 85,
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: BottomNavBarItems(
                    isFreelancer : true,
                    onTabTapped: (index) {
                      setState(() => currentIndex = index);
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              top: -20,
              child: BottomNavBarCenterIcon(
                onTap: () {
                  if (currentIndex != 2) {
                    setState(() => currentIndex = 2);
                  }
                },
              ),
            ),
          ],
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
        context.read<FreelancerProfileCubit>().getFreelancerProfile();
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

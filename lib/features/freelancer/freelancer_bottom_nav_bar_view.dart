// ignore_for_file: deprecated_member_use

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';
import 'package:tradof/core/helpers/exit_dialog.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/utils/widgets/custom_failure_widget.dart';
import 'package:tradof/core/utils/widgets/custom_refresh_indicator.dart';
import 'package:tradof/features/freelancer/freelancer_setting/presentation/views/freelancer_setting_view.dart';

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
              return LazyLoadIndexedStack(
                index: currentIndex,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SlideInLeft(
                      from: 400,
                      delay: Duration(milliseconds: 350),
                      child: _buildNavItem(
                        'assets/images/home2_off.png',
                        'assets/images/home2_on.png',
                        0,
                      ),
                    ),
                    SlideInLeft(
                      from: 400,
                      child: _buildNavItem(
                        'assets/images/add_project_off.png',
                        'assets/images/add_project_on.png',
                        1,
                      ),
                    ),
                    SizedBox(width: 40.w),
                    SlideInRight(
                      from: 400,
                      child: _buildNavItem(
                        'assets/images/wallet_off.png',
                        'assets/images/wallet_on.png',
                        3,
                      ),
                    ),
                    SlideInRight(
                      from: 400,
                      delay: Duration(milliseconds: 350),
                      child: _buildNavItem(
                        'assets/images/setting_off.png',
                        'assets/images/setting_on.png',
                        4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -20,
              child: BounceInUp(
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    if (currentIndex != 2) {
                      setState(() => currentIndex = 2);
                    }
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset('assets/images/user.svg'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String inactiveIcon, String activeIcon, int index) {
    final isSelected = currentIndex == index;
    return InkWell(
      onTap: () {
        if (currentIndex != index) {
          setState(() => currentIndex = index);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Image.asset(
          isSelected ? activeIcon : inactiveIcon,
          width: 24.w,
        ),
      ),
    );
  }
}

class CustomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 20);
    path.quadraticBezierTo(size.width / 2, -20, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
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

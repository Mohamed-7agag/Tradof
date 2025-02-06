import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/features/company/bottom_nav_bar/presentation/logic/company_bottom_nav_bar_cubit.dart';

class CompanyBottomNavBarView extends StatelessWidget {
  const CompanyBottomNavBarView({
    super.key,
    required this.navigationShell,
    this.initialIndex = 0,
  });

  final StatefulNavigationShell navigationShell;
  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    context.read<CompanyBottomNavBarCubit>().updateIndex(initialIndex);
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BlocBuilder<CompanyBottomNavBarCubit, int>(
        builder: (context, selectedIndex) {
          return Stack(
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
                          context,
                          'assets/images/home_off.png',
                          'assets/images/home_on.png',
                          0,
                        ),
                      ),
                      SlideInLeft(
                        from: 400,
                        child: _buildNavItem(
                          context,
                          'assets/images/add_project_off.png',
                          'assets/images/add_project_on.png',
                          1,
                        ),
                      ),
                      SizedBox(width: 40.w),
                      SlideInRight(
                        from: 400,
                        child: _buildNavItem(
                          context,
                          'assets/images/wallet_off.png',
                          'assets/images/wallet_on.png',
                          3,
                        ),
                      ),
                      SlideInRight(
                        from: 400,
                        delay: Duration(milliseconds: 350),
                        child: _buildNavItem(
                          context,
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
                  child: GestureDetector(
                    onTap: () {
                      context.read<CompanyBottomNavBarCubit>().updateIndex(2);
                      navigationShell.goBranch(2);
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        'assets/images/user.svg',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildNavItem(
      BuildContext context, String inactiveIcon, String activeIcon, int index) {
    final isSelected = navigationShell.currentIndex == index;
    return GestureDetector(
      onTap: () {
        context.read<CompanyBottomNavBarCubit>().updateIndex(index);
        navigationShell.goBranch(index);
      },
      child: Image.asset(
        isSelected ? activeIcon : inactiveIcon,
        width: 24.w,
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

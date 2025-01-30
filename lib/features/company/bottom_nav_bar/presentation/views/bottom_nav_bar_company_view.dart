import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/features/company/company_setting/presentation/views/company_setting_view.dart';
import 'package:tradof/features/company/profile_company/presentation/views/profile_company_view.dart';
import 'package:tradof/features/freelancer/dashbord/presentation/views/freelance_dashbord_view.dart';

class BottomNavBarCompanyView extends StatefulWidget {
  const BottomNavBarCompanyView({super.key});

  @override
  State<BottomNavBarCompanyView> createState() =>
      _BottomNavBarCompanyViewState();
}

class _BottomNavBarCompanyViewState extends State<BottomNavBarCompanyView> {
  int _selectedIndex = 0;

  final List<Widget> views = [
    FreelanceDashbordView(),
    FreelanceDashbordView(),
    ProfileCompanyView(),
    FreelanceDashbordView(),
    CompanySettingView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: views[_selectedIndex],
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipPath(
            clipper: CustomNavBarClipper(),
            child: Container(
              height: 100.h,
              color: AppColors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem('assets/images/home.svg', 0),
                  _buildNavItem('assets/images/layer.svg', 1),
                  SizedBox(width: 50.w),
                  _buildNavItem('assets/images/wallet.svg', 3),
                  _buildNavItem('assets/images/setting.svg', 4),
                ],
              ),
            ),
          ),
          Positioned(
            top: -20,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: GestureDetector(
              onTap: () => _onItemTapped(2),
              child: Container(
                width: 60.w,
                height: 60.h,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xffCE5BEB), Color(0xff5B61EB)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  'assets/images/user.svg',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String icon, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: _selectedIndex == index
          ? ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: [Color(0xffCE5BEB), Color(0xff5B61EB)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds);
              },
              child: SvgPicture.asset(
                icon,
                width: 24.w,
                height: 24.h,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            )
          : Opacity(
              opacity: 0.5,
              child: SvgPicture.asset(
                icon,
                width: 24.w,
                height: 24.h,
                colorFilter: const ColorFilter.mode(
                  Colors.grey,
                  BlendMode.srcIn,
                ),
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

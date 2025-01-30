import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';
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
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LazyLoadIndexedStack(index: _selectedIndex, children: views),
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
                  _buildNavItem(
                    'assets/images/home_off.png',
                    'assets/images/home_on.png',
                    0,
                  ),
                  _buildNavItem(
                    'assets/images/add_project_off.png',
                    'assets/images/add_project_on.png',
                    1,
                  ),
                  SizedBox(width: 40.w),
                  _buildNavItem(
                    'assets/images/wallet_off.png',
                    'assets/images/wallet_on.png',
                    3,
                  ),
                  _buildNavItem(
                    'assets/images/setting_off.png',
                    'assets/images/setting_on.png',
                    4,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -20,
            child: GestureDetector(
              onTap: () => _onItemTapped(2),
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
        ],
      ),
    );
  }

  Widget _buildNavItem(String iconOff, String iconOn, int index) {
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: _selectedIndex == index
          ? Image.asset(iconOn, width: 24.w)
          : Image.asset(iconOff, width: index == 4 ? 25.w : 22.w),
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

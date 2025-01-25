import 'package:flutter/material.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/features/auth/presentation/views/forget_password_view.dart';
import 'package:tradof/features/auth/presentation/views/otp_view.dart';
import 'package:tradof/features/auth/presentation/views/reset_password_view.dart';

class ForgetPasswordPageView extends StatefulWidget {
  const ForgetPasswordPageView({super.key});

  @override
  State<ForgetPasswordPageView> createState() => _ForgetPasswordPageViewState();
}

class _ForgetPasswordPageViewState extends State<ForgetPasswordPageView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() => _currentPage = page);
              },
              children: [
                ForgetPasswordView(pageController: _pageController),
                OtpView(pageController: _pageController),
                ResetPasswordView(),
              ],
            ),
          ),
          _buildDotIndicator(),
          verticalSpace(20),
        ],
      ),
    );
  }

  Widget _buildDotIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: 30,
          height: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: _currentPage == index ? AppColors.primary : AppColors.grey,
          ),
        );
      }),
    );
  }
}

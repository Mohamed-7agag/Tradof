import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../widgets/dot_indicator.dart';
import 'forget_password_view.dart';
import 'otp_view.dart';
import 'reset_password_view.dart';

class ForgetPasswordPageView extends StatefulWidget {
  const ForgetPasswordPageView({super.key});

  @override
  State<ForgetPasswordPageView> createState() => _ForgetPasswordPageViewState();
}

class _ForgetPasswordPageViewState extends State<ForgetPasswordPageView> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

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
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (int page) {
                setState(() => _currentPage = page);
              },
              children: [
                ForgetPasswordView(pageController: _pageController),
                OtpView(pageController: _pageController),
                const ResetPasswordView(),
              ],
            ),
          ),
          verticalSpace(20),
          DotIndicator(
            currentPage: _currentPage,
            activeColor: AppColors.primary,
            inActiveColor: AppColors.grey,
          ),
          verticalSpace(20),
        ],
      ),
    );
  }
}

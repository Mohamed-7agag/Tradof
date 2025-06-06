import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';
import '../widgets/change_company_password_button.dart';
import '../widgets/change_freelancer_password_button.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({required this.isFreelancer, super.key});
  final bool isFreelancer;
  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  late final TextEditingController currentPasswordController;
  late final TextEditingController newPasswordController;
  late final TextEditingController confirmPasswordController;

  @override
  void initState() {
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: 'Change Password',
        actionIcon: HugeIcons.strokeRoundedPencilEdit02,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              verticalSpace(30),
              SlideInLeft(
                from: 400,
                child: CustomTextField(
                  labelText: 'Current Password',
                  controller: currentPasswordController,
                  outlineBorder: true,
                  obscureText: true,
                ),
              ),
              verticalSpace(16),
              SlideInLeft(
                from: 400,
                delay: const Duration(milliseconds: 120),
                child: CustomTextField(
                  labelText: 'New Password',
                  controller: newPasswordController,
                  outlineBorder: true,
                  obscureText: true,
                ),
              ),
              verticalSpace(16),
              SlideInLeft(
                from: 400,
                delay: const Duration(milliseconds: 240),
                child: CustomTextField(
                  labelText: 'Confirm Password',
                  controller: confirmPasswordController,
                  outlineBorder: true,
                  obscureText: true,
                ),
              ),
              verticalSpace(60),
              SlideInLeft(
                from: 400,
                delay: const Duration(milliseconds: 360),
                child: _changePasswordButton(),
              ),
              verticalSpace(40),
            ],
          ),
        ),
      ),
    );
  }

  StatelessWidget _changePasswordButton() {
    return widget.isFreelancer
        ? ChangeFreelancerPasswordButton(
            currentPasswordController: currentPasswordController,
            newPasswordController: newPasswordController,
            confirmPasswordController: confirmPasswordController,
          )
        : ChangeCompanyPasswordButton(
            currentPasswordController: currentPasswordController,
            newPasswordController: newPasswordController,
            confirmPasswordController: confirmPasswordController,
          );
  }
}

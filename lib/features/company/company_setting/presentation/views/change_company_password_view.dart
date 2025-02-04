import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/utils/widgets/custom_text_field.dart';

import '../widgets/change_company_password_app_bar.dart';
import '../widgets/change_company_password_button.dart';

class ChangeCompanyPasswordView extends StatefulWidget {
  const ChangeCompanyPasswordView({super.key});

  @override
  State<ChangeCompanyPasswordView> createState() =>
      _ChangeCompanyPasswordViewState();
}

class _ChangeCompanyPasswordViewState extends State<ChangeCompanyPasswordView> {
  late final TextEditingController oldPasswordController;
  late final TextEditingController newPasswordController;
  late final TextEditingController confirmPasswordController;

  @override
  void initState() {
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ChangeCompanyPasswordAppbar(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    verticalSpace(30),
                    CustomTextField(
                      labelText: 'Old Password',
                      controller: oldPasswordController,
                      outlineBorder: true,
                    ),
                    verticalSpace(16),
                    CustomTextField(
                      labelText: 'New Password',
                      controller: newPasswordController,
                      outlineBorder: true,
                    ),
                    verticalSpace(16),
                    CustomTextField(
                      labelText: 'Confirm Password',
                      controller: confirmPasswordController,
                      outlineBorder: true,
                    ),
                    verticalSpace(60),
                    ChangeCompanyPasswordButton(
                      oldPasswordController: oldPasswordController,
                      newPasswordController: newPasswordController,
                      confirmPasswordController: confirmPasswordController,
                    ),
                    verticalSpace(40),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

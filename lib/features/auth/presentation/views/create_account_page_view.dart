import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/features/auth/presentation/views/register_view.dart';
import 'package:tradof/features/auth/presentation/views/select_account_type_view.dart';

import 'freelancer_register_view.dart';

class CreateAccountPageView extends StatefulWidget {
  const CreateAccountPageView({super.key});

  @override
  State<CreateAccountPageView> createState() => _CreateAccountPageViewState();
}

class _CreateAccountPageViewState extends State<CreateAccountPageView> {
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
      backgroundColor: AppColors.primary,
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                ExpandablePageView(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() => _currentPage = page);
                  },
                  children: [
                    SelectAccountTypeView(pageController: _pageController),
                    RegisterView(pageController: _pageController),
                    FreelancerRegisterView(),
                    //CompanyRegisterView(),
                  ],
                ),
                verticalSpace(20),
                _buildDotIndicator(),
                verticalSpace(20),
              ],
            ),
          )
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
            color: _currentPage == index ? AppColors.white : Colors.grey,
          ),
        );
      }),
    );
  }
}

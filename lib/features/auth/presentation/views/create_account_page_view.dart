import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/features/auth/presentation/logic/registeration_cubit/registeration_cubit.dart';
import 'package:tradof/features/auth/presentation/views/register_view.dart';
import 'package:tradof/features/auth/presentation/views/select_account_type_view.dart';

import '../widgets/dot_indicator.dart';
import 'company_register_view.dart';
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
                Expanded(
                  child: ExpandablePageView(
                    controller: _pageController,
                    physics: NeverScrollableScrollPhysics(),
                    onPageChanged: (int page) {
                      setState(() => _currentPage = page);
                    },
                    children: [
                      SelectAccountTypeView(pageController: _pageController),
                      RegisterView(pageController: _pageController),
                      context.read<RegisterationCubit>().state.userRole ==
                              UserRole.freelancer
                          ? FreelancerRegisterView()
                          : CompanyRegisterView(),
                    ],
                  ),
                ),
                verticalSpace(20),
                DotIndicator(
                  currentPage: _currentPage,
                  activeColor: AppColors.white,
                  inActiveColor: AppColors.grey,
                ),
                verticalSpace(20),
              ],
            ),
          )
        ],
      ),
    );
  }
}

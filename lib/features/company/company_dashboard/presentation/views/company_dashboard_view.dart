import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/features/company/company_profile/data/model/company_model.dart';

import '../../../../freelancer/dashbord/presentation/widgets/charts_completed.dart';
import '../widgets/profile_section.dart';
import '../widgets/switcher_widget.dart';

class CompanyDashboardView extends StatelessWidget {
  const CompanyDashboardView({super.key, required this.companyModel});
  final CompanyModel companyModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            verticalSpace(12),
            ProfileSection(companyModel: companyModel),
            verticalSpace(50),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: -32.5,
                      child: SwitcherWidget(),
                    ),
                    Column(
                      children: [
                        verticalSpace(50),
                        Expanded(
                          flex: 2,
                          child: ListView.builder(
                            itemCount: 3,
                            physics: AlwaysScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.only(left: 10, right: 2),
                            itemBuilder: (context, index) {
                              return CompleteProjectsCard();
                            },
                          ),
                        ),
                        verticalSpace(10),
                        Expanded(
                          flex: 7,
                          child: Container(width: 1.sw),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

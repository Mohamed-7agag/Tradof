import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../company_profile/data/model/company_model.dart';
import 'company_switcher_widget.dart';
import 'started_projects_section.dart';
import 'upcoming_projects_section.dart';

class CompanyDashboardStack extends StatefulWidget {
  const CompanyDashboardStack({required this.companyModel, super.key});
  final CompanyModel companyModel;
  @override
  State<CompanyDashboardStack> createState() => _CompanyDashboardStackState();
}

class _CompanyDashboardStackState extends State<CompanyDashboardStack> {
  final ValueNotifier<int> currentIndexNotifier = ValueNotifier<int>(0);
  @override
  void dispose() {
    currentIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      fit: StackFit.expand,
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 32.5),
          padding: EdgeInsets.only(top: 10, left: 16.w, right: 16.w),
          decoration: _decoration(),
          child: ValueListenableBuilder<int>(
            valueListenable: currentIndexNotifier,
            builder: (context, currentIndex, child) {
              return LazyLoadIndexedStack(
                index: currentIndex,
                children: _companyDashboardChildren,
              );
            },
          ),
        ),
        Positioned(
          top: 0,
          child: CompanySwitcherWidget(
            onSwitch: (index) {
              currentIndexNotifier.value = index;
            },
          ),
        ),
      ],
    );
  }

  List<Widget> get _companyDashboardChildren {
    return [
      const StartedProjectsSection(),
      UpcomingProjectsSection(companyModel: widget.companyModel),
    ];
  }

  BoxDecoration _decoration() {
    return const BoxDecoration(
      color: AppColors.background,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(33),
        topRight: Radius.circular(33),
      ),
    );
  }
}

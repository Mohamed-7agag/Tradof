import 'package:flutter/material.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';
import 'package:tradof/core/theming/app_colors.dart';

import 'company_switcher_widget.dart';
import 'started_projects_section.dart';
import 'upcoming_projects_section.dart';

class CompanyDashboardStack extends StatefulWidget {
  const CompanyDashboardStack({super.key});

  @override
  State<CompanyDashboardStack> createState() => _CompanyDashboardStackState();
}

class _CompanyDashboardStackState extends State<CompanyDashboardStack> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      fit: StackFit.expand,
      children: [
        Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 32.5),
            padding: EdgeInsets.only(top: 10),
            decoration: _decoration(),
            child: LazyLoadIndexedStack(
              index: currentIndex,
              children: [
                StartedProjectsSection(),
                UpcomingProjectsSection(),
              ],
            )),
        Positioned(
          top: 0,
          child: CompanySwitcherWidget(onSwitch: (index) {
            setState(() => currentIndex = index);
          }),
        ),
      ],
    );
  }

  BoxDecoration _decoration() {
    return BoxDecoration(
      color: AppColors.background,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(33),
        topRight: Radius.circular(33),
      ),
    );
  }
}

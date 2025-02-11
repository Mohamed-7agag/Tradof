import 'package:flutter/material.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';
import 'package:tradof/core/theming/app_colors.dart';

import 'all_project_section.dart';
import 'current_project_section.dart';
import 'freelancer_switcher_widget.dart';

class FreelancerDashboardStack extends StatefulWidget {
  const FreelancerDashboardStack({super.key});

  @override
  State<FreelancerDashboardStack> createState() =>
      _FreelancerDashboardStackState();
}

class _FreelancerDashboardStackState extends State<FreelancerDashboardStack> {
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
              CurrentProjectsSection(),
              AllProjectsSection(),
            ],
          ),
        ),
        Positioned(
          top: 0,
          child: FreelancerSwitcherWidget(onSwitch: (index) {
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

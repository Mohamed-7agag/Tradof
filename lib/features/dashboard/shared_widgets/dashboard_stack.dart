import 'package:flutter/material.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../profile/company_profile/data/model/company_model.dart';
import '../company_dashboard/presentation/widgets/started_projects_section.dart';
import '../company_dashboard/presentation/widgets/upcoming_projects_section.dart';
import '../freelancer_dashboard/presentation/widgets/all_project_section.dart';
import '../freelancer_dashboard/presentation/widgets/current_project_section.dart';
import 'switcher_widget.dart';

class DashboardStack extends StatefulWidget {
  const DashboardStack({super.key, this.companyModel});
  final CompanyModel? companyModel;
  @override
  State<DashboardStack> createState() => _DashboardStackState();
}

class _DashboardStackState extends State<DashboardStack> {
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
          padding: const EdgeInsets.only(top: 10),
          decoration: _decoration(),
          child: ValueListenableBuilder<int>(
            valueListenable: currentIndexNotifier,
            builder: (context, currentIndex, child) {
              return LazyLoadIndexedStack(
                index: currentIndex,
                children: _dashboardChildren,
              );
            },
          ),
        ),
        Positioned(
          top: 0,
          child: SwitcherWidget(
            isCompany: widget.companyModel != null,
            onSwitch: (index) {
              currentIndexNotifier.value = index;
            },
          ),
        ),
      ],
    );
  }

  List<Widget> get _dashboardChildren {
    return widget.companyModel != null
        ? [
            const StartedProjectsSection(),
            UpcomingProjectsSection(companyModel: widget.companyModel!),
          ]
        : [
            const CurrentProjectsSection(),
            const AllProjectsSection(),
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

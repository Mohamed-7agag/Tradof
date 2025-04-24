import 'package:flutter/material.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';

import '../../../../../core/theming/app_colors.dart';
import '../views/finance_projects_view.dart';
import 'finance_components.dart';
import 'finance_switcher_widget.dart';

class FinanceStack extends StatefulWidget {
  const FinanceStack({required this.isCompany, super.key});
  final bool isCompany;
  @override
  State<FinanceStack> createState() => _FinanceStackState();
}

class _FinanceStackState extends State<FinanceStack> {
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
                children: _financeChildren,
              );
            },
          ),
        ),
        Positioned(
          top: 0,
          child: FinanceSwitcherWidget(
            onSwitch: (index) {
              currentIndexNotifier.value = index;
            },
          ),
        ),
      ],
    );
  }

  List<Widget> get _financeChildren {
    return [
      const FinanceComponents(),
       FinanceProjectsView(isCompany: widget.isCompany),
    ];
  }

  BoxDecoration _decoration() {
    return const BoxDecoration(
      color: AppColors.background,
    );
  }
}

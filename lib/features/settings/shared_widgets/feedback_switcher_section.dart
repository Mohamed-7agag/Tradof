import 'package:flutter/material.dart';

import '../../../core/theming/app_colors.dart';
import 'feedback_switcher_item.dart';

class FeedbackSwitcherSection extends StatefulWidget {
  const FeedbackSwitcherSection({super.key});

  @override
  State<FeedbackSwitcherSection> createState() =>
      _FeedbackSwitcherSectionState();
}

class _FeedbackSwitcherSectionState extends State<FeedbackSwitcherSection> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(color: Colors.grey[200]!, blurRadius: 4),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(5, (index) {
          return InkWell(
            onTap: () {
              setState(() => selectedIndex = index);
            },
            child: FeedbackSwitcherItem(
              index: index,
              isSelected: selectedIndex == index,
            ),
          );
        }),
      ),
    );
  }
}

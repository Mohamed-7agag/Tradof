import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/app_colors.dart';
import '../logic/miscellaneous_cubit/miscellaneous_cubit.dart';
import 'feedback_switcher_item.dart';

class FeedbackSwitcherSection extends StatefulWidget {
  const FeedbackSwitcherSection({super.key});

  @override
  State<FeedbackSwitcherSection> createState() =>
      _FeedbackSwitcherSectionState();
}

class _FeedbackSwitcherSectionState extends State<FeedbackSwitcherSection> {
  static const Map<int, Color> _feedbackColors = {
    0: Colors.red,
    1: Colors.pink,
    2: Colors.blue,
    3: Colors.green,
    4: Colors.orange,
  };

  static const Map<int, String> _feedbackNames = {
    0: 'Very Bad',
    1: 'Bad',
    2: 'Good',
    3: 'Very Good',
    4: 'Excellent',
  };

  static const Map<int, IconData> _feedbackIcons = {
    0: Icons.sentiment_very_dissatisfied,
    1: Icons.sentiment_dissatisfied,
    2: Icons.sentiment_neutral,
    3: Icons.sentiment_satisfied,
    4: Icons.sentiment_very_satisfied,
  };

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
              context
                  .read<MiscellaneousCubit>()
                  .setRate(_feedbackNames[index]!);
            },
            child: FeedbackSwitcherItem(
              isSelected: selectedIndex == index,
              feedbackName: _feedbackNames[index]!,
              feedbackIcon: _feedbackIcons[index]!,
              selectedColor: _feedbackColors[index]!,
            ),
          );
        }),
      ),
    );
  }
}

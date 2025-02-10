import 'package:flutter/material.dart';

import '../../../../core/utils/widgets/custom_button.dart';

class UpdateProjectButton extends StatelessWidget {
  const UpdateProjectButton({
    super.key,
    required this.projectNameController,
    required this.projectDescriptionController,
    required this.minBudgetController,
    required this.maxBudgetController,
    required this.daysController,
  });
  final TextEditingController projectNameController;
  final TextEditingController projectDescriptionController;
  final TextEditingController minBudgetController;
  final TextEditingController maxBudgetController;
  final TextEditingController daysController;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Update Project',
      onPressed: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}

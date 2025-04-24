import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../widgets/finance_stack.dart';

class FinanceView extends StatelessWidget {
  const FinanceView({required this.isCompany, super.key});
  final bool isCompany;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: 'Finances',
        titlePadding: 16,
        actionIcon: HugeIcons.strokeRoundedCreditCardPos,
      ),
      body: Container(
        color: AppColors.primary,
        child: Column(
          children: [
            verticalSpace(10),
             Expanded(child: FinanceStack(isCompany: isCompany)),
          ],
        ),
      ),
    );
  }
}

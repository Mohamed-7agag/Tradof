import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';

class WithdrawProfitView extends StatefulWidget {
  const WithdrawProfitView({required this.availableBalance, super.key});
  final double availableBalance;

  @override
  State<WithdrawProfitView> createState() => _WithdrawProfitViewState();
}

class _WithdrawProfitViewState extends State<WithdrawProfitView> {
  late TextEditingController _amountController;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: 'Withdraw Profit',
        actionIcon: HugeIcons.strokeRoundedCreditCardPos,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SvgPicture.asset('assets/images/withdraw.svg', width: 0.8.sw),
              verticalSpace(45),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                width: 1.sw,
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Available Balance',
                      style: AppStyle.robotoRegular12.copyWith(
                        color: AppColors.darkGrey,
                      ),
                    ),
                    verticalSpace(5),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(
                        vertical: 17,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        '${widget.availableBalance} EGP',
                        style: AppStyle.poppinsMedium15,
                      ),
                    ),
                    verticalSpace(20),
                    Text(
                      'Withdraw Amount',
                      style: AppStyle.robotoRegular12.copyWith(
                        color: AppColors.darkGrey,
                      ),
                    ),
                    verticalSpace(5),
                    TextField(
                      cursorColor: AppColors.primary,
                      keyboardType: TextInputType.number,
                      style: AppStyle.poppinsMedium15,
                      controller: _amountController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.white,
                        hintText: 'Enter amount (EGP)',
                        hintStyle: AppStyle.poppinsMedium14
                            .copyWith(color: AppColors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    verticalSpace(30),
                    Align(
                      child: CustomButton(
                        text: 'Next',
                        onPressed: () {
                          _withdrawLogic(context);
                        },
                        width: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }

  void _withdrawLogic(BuildContext context) {
    if (_amountController.text.isEmpty) {
      warningToast(context, 'Warning', 'Please enter an amount');
    } else {
      final double amount = double.parse(_amountController.text);
      if (amount > widget.availableBalance || amount <= 0) {
        errorToast(context, 'Error', 'Insufficient balance');
      } else {
        context.pushNamed(
          Routes.withdrawFormViewRoute,
          arguments: amount,
        );
      }
    }
  }
}

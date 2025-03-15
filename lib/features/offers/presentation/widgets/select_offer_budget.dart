import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../logic/cubit/offer_cubit.dart';

class SelectOfferBudget extends StatefulWidget {
  const SelectOfferBudget({super.key, this.initialPrice});

  final double? initialPrice;

  @override
  State<SelectOfferBudget> createState() => _SelectOfferBudgetState();
}

class _SelectOfferBudgetState extends State<SelectOfferBudget> {
  double selectedBudget = 0.0;
  @override
  void initState() {
    super.initState();
    selectedBudget = widget.initialPrice ?? 0.0;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Offer Price",
          style: AppStyle.poppinsMedium14,
        ),
        verticalSpace(5),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 4.5,
            activeTrackColor: AppColors.lightOrange,
            inactiveTrackColor: Colors.black12,
            thumbColor: AppColors.lightOrange,
            year2023: false,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
          ),
          child: Slider(
            max: 5000,
            divisions: 200,
            value: selectedBudget,
            onChanged: (newValue) {
              setState(() {
                selectedBudget = newValue;
                context.read<OfferCubit>().setOfferPrice(price: selectedBudget);
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "0\$",
              style: AppStyle.robotoRegular12.copyWith(
                color: AppColors.darkGrey,
              ),
            ),
            Text(
              "${selectedBudget.ceil()}\$",
              style: AppStyle.poppinsMedium14,
            ),
            Text(
              "5000\$",
              style: AppStyle.robotoRegular12.copyWith(
                color: AppColors.darkGrey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

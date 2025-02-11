import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';

import '../logic/cubit/offer_cubit.dart';

class SelectOfferBudget extends StatefulWidget {
  const SelectOfferBudget({super.key});

  @override
  State<SelectOfferBudget> createState() => _SelectOfferBudgetState();
}

class _SelectOfferBudgetState extends State<SelectOfferBudget> {
  @override
  void initState() {
    context.read<OfferCubit>().selectedBudget = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Offer Budget",
            style: AppStyle.robotoRegular15.copyWith(color: AppColors.darkGrey),
          ),
          verticalSpace(10),
          SizedBox(height: 8),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 6.0,
              activeTrackColor: AppColors.lightOrange,
              inactiveTrackColor: Colors.grey[300],
              thumbColor: Colors.white,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
              overlayColor: Colors.transparent,
            ),
            child: Slider(
              min: 0,
              max: 5000,
              value: context.read<OfferCubit>().selectedBudget,
              onChanged: (newValue) {
                setState(() {
                  context.read<OfferCubit>().selectedBudget = newValue;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("0", style: TextStyle(fontSize: 14, color: Colors.grey)),
              Text("\$${context.read<OfferCubit>().selectedBudget.toInt()}",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              Text("5000", style: TextStyle(fontSize: 14, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}

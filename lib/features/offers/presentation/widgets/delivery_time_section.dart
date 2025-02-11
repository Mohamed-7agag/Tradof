import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/features/offers/presentation/logic/cubit/offer_cubit.dart';

class DeliveryTimeSection extends StatefulWidget {
  const DeliveryTimeSection({super.key});

  @override
  State<DeliveryTimeSection> createState() => _DeliveryTimeSectionState();
}

class _DeliveryTimeSectionState extends State<DeliveryTimeSection> {
  
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: context.read<OfferCubit>().selectedDate ,
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != context.read<OfferCubit>().selectedDate) {
      setState(() {
        context.read<OfferCubit>().selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => _selectDate(context),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: AppColors.grey),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivery Time',
                  style: AppStyle.robotoRegular15.copyWith(
                    color: AppColors.darkGrey,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('dd/MM/yyyy').format(context.read<OfferCubit>().selectedDate),
                      style: AppStyle.robotoRegular15,
                    ),
                    Icon(
                      Icons.calendar_today_outlined,
                      color: AppColors.primary,
                      size: 20.w,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

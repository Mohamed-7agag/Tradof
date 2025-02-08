import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../logic/project_cubit/project_cubit.dart';
import 'custom_date_picker.dart';

class SelectDateSection extends StatefulWidget {
  const SelectDateSection({super.key});

  @override
  State<SelectDateSection> createState() => _SelectDateSectionState();
}

class _SelectDateSectionState extends State<SelectDateSection> {
  String? selectedDate;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () async {
        final date = await customDatePicker(context);
        if (date != null) {
          setState(() {
            selectedDate = DateFormat('dd / MM / yyyy').format(date);
            int days = date.difference(DateTime.now()).inDays;
            context.read<ProjectCubit>().setCreateProjectData(days: days);
          });
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 17.h),
        width: 1.sw,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.grey),
        ),
        child: Text(
          selectedDate ?? 'Choose Delivery Date',
          style: selectedDate == null
              ? AppStyle.robotoRegular12.copyWith(
                  color: AppColors.darkGrey,
                )
              : AppStyle.robotoRegular14.copyWith(),
        ),
      ),
    );
  }
}

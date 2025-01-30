import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/features/auth/presentation/logic/tables_cubit/tables_cubit.dart';

class PreferredLanguage extends StatelessWidget {
 const PreferredLanguage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Preferred Language', style: AppStyle.poppinsMedium15),
              SvgPicture.asset('assets/images/add.svg')
            ],
          ),
          verticalSpace(10),
          BlocBuilder<TablesCubit, TablesState>(
            builder: (context, state) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.symmetric(vertical: 24.h),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 30.w, right: 45.w, bottom: 15.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Language",
                            style: AppStyle.robotoBold20.copyWith(
                                color: AppColors.primary, fontSize: 12.sp),
                          ),
                          Text(
                            "IEFT tag",
                            style: AppStyle.robotoBold20.copyWith(
                                color: AppColors.primary, fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),
                    //   Divider(),
                    Column(
                      children: context.read<TablesCubit>().state.selectedPreferedLanguages.map(
                        (language) {
                          return Column(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 5.w, right: 45.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/close.svg',
                                          height: 20.h,
                                          width: 20.w,
                                        ),
                                        SizedBox(width: 6),
                                        Text(language.name,
                                            style: AppStyle.robotoRegular12),
                                      ],
                                    ),
                                    Text(
                                      language.code,
                                      style: AppStyle.robotoRegular12,
                                    ),
                                  ],
                                ),
                              ),
                              // if (language != languages.last)
                              //   Padding(
                              //     padding:
                              //         EdgeInsets.symmetric(horizontal: 17.w),
                              //     child: Divider(),
                              //   ),
                            ],
                          );
                        },
                      ).toList(),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

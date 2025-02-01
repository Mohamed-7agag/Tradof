import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/core/utils/logic/meta_data_cubit/meta_data_cubit.dart';
import 'package:tradof/features/auth/data/model/language_model.dart';
import 'package:tradof/features/auth/presentation/logic/tables_cubit/tables_cubit.dart';
import 'package:tradof/features/company/profile_company/presentation/logic/cubit/profile_company_cubit.dart';

class PreferredLanguage extends StatefulWidget {
  const PreferredLanguage({super.key, required this.languages});

  final List<LanguageModel> languages;

  @override
  State<PreferredLanguage> createState() => _PreferredLanguageState();
}

class _PreferredLanguageState extends State<PreferredLanguage> {
  @override
  void initState() {
    context.read<MetaDataCubit>().getLanguages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ProfileCompanyCubit, ProfileCompanyState>(
          listener: (context, state) async {},
        ),
      ],
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Preferred Language', style: AppStyle.poppinsMedium15),
                GestureDetector(
                  onTap: () => _showPreferedLanguageDialog(context),
                  child: SvgPicture.asset('assets/images/add.svg'),
                )
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
                      Column(
                        children: widget.languages.map((language) {
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
                                        GestureDetector(
                                          onTap: () {},
                                          child: SvgPicture.asset(
                                            'assets/images/close.svg',
                                            height: 20.h,
                                            width: 20.w,
                                          ),
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
                              if (language != widget.languages.last)
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 17.w),
                                  child: Divider(),
                                ),
                            ],
                          );
                        }).toList(),
                      ),
                      verticalSpace(10),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  _showPreferedLanguageDialog(BuildContext context) {
    final tablesCubit = context.read<TablesCubit>();
    final profileCompanyCubit = context.read<ProfileCompanyCubit>();
    final List<LanguageModel> preferedLanguages =
        context.read<MetaDataCubit>().state.languages;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Select Language',
            style: AppStyle.poppinsBold22.copyWith(color: Colors.white),
          ),
          backgroundColor: AppColors.darkGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          content: SizedBox(
            width: 0.9.sw,
            child: ListView.separated(
              itemCount: preferedLanguages.length,
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) =>
                  Divider(color: Colors.white10, height: 0),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  title: Text(
                    '${preferedLanguages[index].name} (${preferedLanguages[index].code})',
                    style:
                        AppStyle.robotoRegular15.copyWith(color: Colors.white),
                  ),
                  onTap: ()  {
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}

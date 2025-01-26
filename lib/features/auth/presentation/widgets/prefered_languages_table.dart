import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';

class PreferedLanguagesTable extends StatelessWidget {
  const PreferedLanguagesTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Prefered Languages',
              style:
                  AppStyle.poppinsSemiBold14.copyWith(color: AppColors.white),
            ),
            SvgPicture.asset('assets/images/add.svg', width: 25),
          ],
        ),
        verticalSpace(12),
        SizedBox(
          width: 1.sw,
          child: DataTable(
            columns: [
              DataColumn(
                label: Text(
                  'Prefered Languages',
                  style: AppStyle.poppinsSemiBold14.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'IEFT tag',
                  style: AppStyle.poppinsSemiBold14.copyWith(
                    color: AppColors.white,
                  ),
                ),
              )
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(
                    Row(
                      children: [
                        Icon(Icons.cancel, color: Colors.red),
                        horizontalSpace(6),
                        Text(
                          'English - French',
                          style: AppStyle.robotoRegular12.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  DataCell(
                    Text(
                      'en-fr',
                      style: AppStyle.robotoRegular12.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(
                   Row(
                      children: [
                        Icon(Icons.cancel, color: Colors.red),
                        horizontalSpace(6),
                        Text(
                          'English - French',
                          style: AppStyle.robotoRegular12.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  DataCell(
                    Text(
                      'en-fr',
                      style: AppStyle.robotoRegular12.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
            horizontalMargin: 15,
            columnSpacing: 28,
            border: TableBorder.all(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}

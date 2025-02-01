import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/features/auth/data/model/language_model.dart';

class PreferredLanguage extends StatelessWidget {
  const PreferredLanguage({super.key, required this.preferedLanguages});

  final List<LanguageModel> preferedLanguages;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Preferred Language', style: AppStyle.poppinsMedium15),
            GestureDetector(
              onTap: () => {},
              child: Image.asset('assets/images/edit.png', width: 25),
            )
          ],
        ),
        verticalSpace(10),
        SizedBox(
          width: 1.sw,
          child: DataTable(
            columns: [
              DataColumn(
                label: Text(
                  'Prefered Languages',
                  style: AppStyle.poppinsSemiBold14,
                ),
              ),
              DataColumn(
                label: Text(
                  'IEFT tag',
                  style: AppStyle.poppinsSemiBold14,
                ),
              )
            ],
            rows: preferedLanguages.map((language) {
              return DataRow(
                cells: [
                  DataCell(
                    Text(
                      language.name,
                      style: AppStyle.robotoRegular12,
                    ),
                  ),
                  DataCell(
                    Text(
                      language.code,
                      style: AppStyle.robotoRegular12,
                    ),
                  ),
                ],
              );
            }).toList(),
            horizontalMargin: 14,
            columnSpacing: 26,
            dividerThickness: 0,
            decoration: BoxDecoration(
              color: AppColors.cardColor,
              borderRadius: BorderRadius.circular(10),
            ),
            border: TableBorder.all(
              color: AppColors.cardDarkColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/features/company/profile_company/data/model/company_model.dart';

import '../../../../../core/routing/routes.dart';

class IndustriesServed extends StatelessWidget {
  const IndustriesServed({super.key, required this.companyModel});

  final CompanyModel companyModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Industries Served', style: AppStyle.poppinsMedium15),
            GestureDetector(
              onTap: () {
                Map<String, dynamic> data = {
                  'isPreferedLanguages': false,
                  'data': companyModel
                };
                context.pushNamed(
                  Routes.updateCompanyProfileTablesViewRoute,
                  extra: data,
                );
              },
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
                  'Industries Served',
                  style: AppStyle.poppinsSemiBold14,
                ),
              ),
            ],
            rows: companyModel.specializations.map((language) {
              return DataRow(
                cells: [
                  DataCell(
                    Text(
                      language.name,
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

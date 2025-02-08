import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/routing/routes.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/features/company/company_profile/data/model/company_model.dart';

import '../logic/company_profile_cubit/company_profile_cubit.dart';

class PreferredLanguage extends StatelessWidget {
  const PreferredLanguage({super.key, required this.companyModel});

  final CompanyModel companyModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Preferred Language', style: AppStyle.poppinsMedium15),
            GestureDetector(
              onTap: () async {
                Map<String, dynamic> data = {
                  'isPreferedLanguages': true,
                  'data': companyModel
                };
                final result = await context.push(
                  Routes.updateCompanyProfileTablesViewRoute,
                  extra: data,
                );

                if (result == true && context.mounted) {
                  context.read<CompanyProfileCubit>().getCompanyProfile();
                }
              },
              child: Image.asset('assets/images/edit.png', width: 25),
            )
          ],
        ),
        verticalSpace(10),
        SizedBox(
          width: double.infinity,
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
            rows: companyModel.preferredLanguages.map((language) {
              return DataRow(
                cells: [
                  DataCell(
                    Text(
                      language.languageName,
                      style: AppStyle.robotoRegular12,
                    ),
                  ),
                  DataCell(
                    Text(
                      language.languageCode,
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_style.dart';
import '../../data/model/company_model.dart';
import '../logic/company_profile_cubit/company_profile_cubit.dart';

class PreferredLanguage extends StatelessWidget {
  const PreferredLanguage({required this.companyModel, super.key});

  final CompanyModel companyModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Preferred Language', style: AppStyle.poppinsMedium15),
            InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              onTap: () async {
                final Map<String, dynamic> data = {
                  'isPreferedLanguages': true,
                  'data': companyModel
                };
                final result = await context.pushNamed(
                  Routes.updateCompanyProfileTablesViewRoute,
                  arguments: data,
                );

                if (result == true && context.mounted) {
                  context.read<CompanyProfileCubit>().getCompanyProfile();
                }
              },
              child: const HugeIcon(
                icon: HugeIcons.strokeRoundedPencilEdit02,
                color: AppColors.lightOrange,
                size: 27,
              ),
            ),
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
                label: Expanded(
                  child: Text(
                    'IEFT tag',
                    style: AppStyle.poppinsSemiBold14,
                  ),
                ),
              )
            ],
            rows: companyModel.preferredLanguages.map((language) {
              return DataRow(
                cells: [
                  DataCell(
                    Text(
                      '${language.languageName} (${language.countryName})',
                      style: AppStyle.robotoRegular12,
                    ),
                  ),
                  DataCell(
                    Text(
                      '${language.languageCode} (${language.countryCode})',
                      style: AppStyle.robotoRegular12,
                    ),
                  ),
                ],
              );
            }).toList(),
            horizontalMargin: 14,
            columnSpacing: 26,
            dividerThickness: 0,
            decoration: const BoxDecoration(
              color: AppColors.cardColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            border: TableBorder.all(
              color: AppColors.cardDarkColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}

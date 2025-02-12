import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';


import '../../../../../core/routing/routes.dart';
import '../../data/model/freelancer_model.dart';
import '../logic/freelancer_profile_cubit/freelancer_profile_cubit.dart';

class FreelancerLanguagePair extends StatelessWidget {
  const FreelancerLanguagePair({super.key, required this.freelancerModel});

  final FreelancerModel freelancerModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Language Pairs', style: AppStyle.poppinsMedium15),
            GestureDetector(
              onTap: () async {
                Map<String, dynamic> data = {
                  'isLanguagePair': true,
                  'data': freelancerModel
                };
                final result = await context.pushNamed(
                  Routes.updateFreelancerProfileTablesViewRoute,
                  arguments: data,
                );

                if (result == true && context.mounted) {
                  context.read<FreelancerProfileCubit>().getFreelancerProfile();
                }
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
                  'Language Pairs',
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
            rows: freelancerModel.freelancerLanguagePairs.map((languagePair) {
              return DataRow(
                cells: [
                  DataCell(
                    Text(
                      '${languagePair.languageFromName} - ${languagePair.languageToName}',
                      style: AppStyle.robotoRegular12,
                    ),
                  ),
                  DataCell(
                    Text(
                      languagePair.languageFromId.toString(),
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

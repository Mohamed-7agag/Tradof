import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_style.dart';
import '../../data/model/freelancer_model.dart';
import '../logic/freelancer_profile_cubit/freelancer_profile_cubit.dart';

class FreelancerLanguagePair extends StatelessWidget {
  const FreelancerLanguagePair({required this.freelancerModel, super.key});

  final FreelancerModel freelancerModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SlideInLeft(
              from: 400,
              child: Text('Language Pairs', style: AppStyle.poppinsMedium15),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(4),
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
              child: SlideInRight(
                from: 200,
                child: const HugeIcon(
                  icon: HugeIcons.strokeRoundedPencilEdit02,
                  color: AppColors.lightOrange,
                  size: 27,
                ),
              ),
            )
          ],
        ),
        verticalSpace(10),
        SizedBox(
          width: 1.sw,
          child: SlideInLeft(
            from: 400,
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
              rows: freelancerModel.languagePairs.map((languagePair) {
                return DataRow(
                  cells: [
                    DataCell(
                      Text(
                        '${languagePair.languageFromName} (${languagePair.countryFromCode}) - ${languagePair.languageToName} (${languagePair.countryToCode})',
                        style: AppStyle.robotoRegular12,
                      ),
                    ),
                    DataCell(
                      Text(
                        '${languagePair.languageFromCode} - ${languagePair.languageToCode}',
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
        ),
      ],
    );
  }
}

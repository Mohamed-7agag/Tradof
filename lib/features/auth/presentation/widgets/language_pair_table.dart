import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../../../core/utils/logic/meta_data_cubit/meta_data_cubit.dart';
import '../../../../core/utils/logic/tables_cubit/tables_cubit.dart';
import 'show_language_pair_dialog.dart';

class LanguagePairTable extends StatelessWidget {
  const LanguagePairTable({super.key, this.darkColors = false});
  final bool darkColors;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Language Pair',
              style: AppStyle.poppinsSemiBold14.copyWith(
                color: darkColors ? AppColors.black : AppColors.white,
              ),
            ),
            InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              onTap: () {
                if (context.read<MetaDataCubit>().state.languages.isEmpty) {
                  context.read<MetaDataCubit>().getLanguages();
                }
                showLanguagePairDialog(context);
              },
              child: const HugeIcon(
                icon: HugeIcons.strokeRoundedAddSquare,
                color: AppColors.lightOrange,
                size: 27,
              ),
            ),
          ],
        ),
        verticalSpace(12),
        SizedBox(
          width: 1.sw,
          child: BlocBuilder<TablesCubit, TablesState>(
            buildWhen: (previous, current) =>
                current.selectedLanguagePair != previous.selectedLanguagePair,
            builder: (context, state) {
              return DataTable(
                columns: [
                  DataColumn(
                    label: Text(
                      'Language Pair',
                      style: AppStyle.poppinsSemiBold14.copyWith(
                        color: darkColors ? AppColors.black : AppColors.white,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'IEFT tag',
                        style: AppStyle.poppinsSemiBold14.copyWith(
                          color: darkColors ? AppColors.black : AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
                rows: state.selectedLanguagePair.map((language) {
                  return DataRow(
                    cells: [
                      DataCell(
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<TablesCubit>()
                                    .removeLanguagePair(language);
                              },
                              child: const HugeIcon(
                                icon:
                                    HugeIcons.strokeRoundedCancelCircleHalfDot,
                                color: Colors.red,
                                size: 18,
                              ),
                            ),
                            horizontalSpace(6),
                            Expanded(
                              child: Text(
                                '${language.fromLanguage.languageName} (${language.fromLanguage.countryName}) - ${language.toLanguage.languageName} (${language.toLanguage.countryName})',
                                style: AppStyle.robotoRegular12.copyWith(
                                  color: darkColors
                                      ? AppColors.black
                                      : AppColors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      DataCell(
                        Text(
                          '${language.fromLanguage.languageCode} (${language.fromLanguage.countryCode}) - ${language.toLanguage.languageCode} (${language.toLanguage.countryCode})',
                          style: AppStyle.robotoRegular12.copyWith(
                            color:
                                darkColors ? AppColors.black : AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
                horizontalMargin: 12,
                columnSpacing: 22,
                dividerThickness: 0,
                border: TableBorder.all(
                  color: darkColors ? AppColors.cardDarkColor : AppColors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                decoration: darkColors
                    ? const BoxDecoration(
                        color: AppColors.cardColor,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )
                    : null,
              );
            },
          ),
        ),
      ],
    );
  }
}

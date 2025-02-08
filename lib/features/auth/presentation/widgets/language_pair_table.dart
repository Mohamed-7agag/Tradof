import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';

import '../logic/tables_cubit/tables_cubit.dart';
import 'show_language_pair_dialog.dart';

class LanguagePairTable extends StatelessWidget {
  const LanguagePairTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Language Pair',
              style:
                  AppStyle.poppinsSemiBold14.copyWith(color: AppColors.white),
            ),
            GestureDetector(
              onTap: () {
                showLanguagePairDialog(context);
              },
              child: SvgPicture.asset('assets/images/add.svg', width: 28),
            ),
          ],
        ),
        verticalSpace(12),
        SizedBox(
          width: double.infinity,
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
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'IEFT tag',
                        style: AppStyle.poppinsSemiBold14.copyWith(
                          color: AppColors.white,
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
                              child: Icon(Icons.cancel, color: Colors.red),
                            ),
                            horizontalSpace(6),
                            Expanded(
                              child: Text(
                                '${language.fromLanguage.languageName} - ${language.toLanguage.languageName}',
                                style: AppStyle.robotoRegular12.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      DataCell(
                        Text(
                          '${language.fromLanguage.languageCode} - ${language.toLanguage.languageCode}',
                          style: AppStyle.robotoRegular12.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
                horizontalMargin: 12,
                columnSpacing: 22,
                border: TableBorder.all(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

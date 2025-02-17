import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';

import '../../../../core/utils/logic/meta_data_cubit/meta_data_cubit.dart';
import '../../../../core/utils/widgets/language_selection_dialog.dart';
import '../logic/tables_cubit/tables_cubit.dart';

class PreferedLanguagesTable extends StatelessWidget {
  const PreferedLanguagesTable({
    super.key,
    this.darkColors = false,
  });
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
              'Prefered Languages',
              style: AppStyle.poppinsSemiBold14.copyWith(
                  color: darkColors ? AppColors.black : AppColors.white),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(4),
              onTap: () {
                _showPreferedLanguageDialog(context);
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
                current.selectedPreferedLanguages !=
                previous.selectedPreferedLanguages,
            builder: (context, state) {
              return DataTable(
                columns: [
                  DataColumn(
                    label: Text(
                      'Prefered Languages',
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
                  )
                ],
                rows: state.selectedPreferedLanguages.map((language) {
                  return DataRow(
                    cells: [
                      DataCell(
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<TablesCubit>()
                                    .removePreferedLanguage(language);
                              },
                              child: const HugeIcon(
                                icon:
                                    HugeIcons.strokeRoundedCancelCircleHalfDot,
                                color: Colors.red,
                                size: 20,
                              ),
                            ),
                            horizontalSpace(6),
                            Expanded(
                              child: Text(
                                '${language.languageName} (${language.countryName})',
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
                          '${language.languageCode} (${language.countryCode})',
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
                  borderRadius: BorderRadius.circular(10),
                ),
                decoration: darkColors
                    ? BoxDecoration(
                        color: AppColors.cardColor,
                        borderRadius: BorderRadius.circular(10),
                      )
                    : null,
              );
            },
          ),
        ),
      ],
    );
  }

  _showPreferedLanguageDialog(BuildContext context) {
    final cubit = context.read<TablesCubit>();
    final metaDataCubit = context.read<MetaDataCubit>();

    showDialog(
      context: context,
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(value: cubit),
            BlocProvider.value(value: metaDataCubit..getLanguages()),
          ],
          child: const LanguageSelectionDialog(),
        );
      },
    );
  }
}

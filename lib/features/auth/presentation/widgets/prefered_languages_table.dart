import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/core/utils/app_constants.dart';

import '../logic/cubit/tables_cubit.dart';

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
            GestureDetector(
              onTap: () {
                _showPreferedLanguageDialog(context);
              },
              child: SvgPicture.asset('assets/images/add.svg', width: 28),
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
                              child: Icon(Icons.cancel, color: Colors.red)),
                            horizontalSpace(6),
                            Text(
                              language.languageName,
                              style: AppStyle.robotoRegular12.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      DataCell(
                        Text(
                          language.tag,
                          style: AppStyle.robotoRegular12.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
                horizontalMargin: 15,
                columnSpacing: 28,
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

  _showPreferedLanguageDialog(BuildContext context) {
    final cubit = context.read<TablesCubit>();
    showDialog(
      context: context,
      builder: (context) {
        return BlocProvider.value(
          value: cubit,
          child: AlertDialog(
            title: Text('Select Language'),
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            content: SizedBox(
              width: 9.sw,
              child: ListView.separated(
                itemCount: availableLanguage.length,
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(color: AppColors.background,height: 0),
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: Text(availableLanguage[index].languageName),
                    subtitle: Text(availableLanguage[index].tag),
                    onTap: () {
                      context.read<TablesCubit>().addPreferedLanguage(
                            availableLanguage[index],
                          );
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

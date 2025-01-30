import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/features/auth/data/model/language_model.dart';

import '../logic/registeration_cubit/registeration_cubit.dart';
import '../logic/tables_cubit/tables_cubit.dart';

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
                              language.name,
                              style: AppStyle.robotoRegular12.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      DataCell(
                        Text(
                          language.code,
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
    final List<LanguageModel> preferedLanguages =
        context.read<RegisterationCubit>().state.languages;
    showDialog(
      context: context,
      builder: (context) {
        return BlocProvider.value(
          value: cubit,
          child: AlertDialog(
            title: Text(
              'Select Language',
              style: AppStyle.poppinsBold22.copyWith(color: Colors.white),
            ),
            backgroundColor: AppColors.darkGrey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            content: SizedBox(
              width: 0.9.sw,
              child: ListView.separated(
                itemCount: preferedLanguages.length,
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(color: Colors.white10, height: 0),
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    title: Text(
                      '${preferedLanguages[index].name} (${preferedLanguages[index].code})',
                      style: AppStyle.robotoRegular15
                          .copyWith(color: Colors.white),
                    ),
                    onTap: () {
                      context.read<TablesCubit>().addPreferedLanguage(
                            preferedLanguages[index],
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

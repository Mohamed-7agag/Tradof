import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/core/utils/widgets/custom_failure_widget.dart';
import 'package:tradof/core/utils/widgets/custom_loading_widget.dart';

import '../../../../core/utils/logic/meta_data_cubit/meta_data_cubit.dart';
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Prefered Languages',
              style: AppStyle.poppinsSemiBold14.copyWith(
                  color: darkColors ? AppColors.black : AppColors.white),
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
          width: double.infinity,
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
                    label: Text(
                      'IEFT tag',
                      style: AppStyle.poppinsSemiBold14.copyWith(
                        color: darkColors ? AppColors.black : AppColors.white,
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
                                color: darkColors
                                    ? AppColors.black
                                    : AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      DataCell(
                        Text(
                          language.languageCode,
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
              height: 0.7.sh,
              child: BlocBuilder<MetaDataCubit, MetaDataState>(
                buildWhen: (previous, current) =>
                    previous.languages != current.languages,
                builder: (context, state) {
                  if (state.status.isLoading) {
                    return const CustomLoadingWidget(color: AppColors.white);
                  } else if (state.status.isError) {
                    return CustomFailureWidget(
                      text: state.errorMessage,
                      textColor: AppColors.white,
                    );
                  }
                  return ListView.separated(
                    itemCount: state.languages.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(color: Colors.white10, height: 0),
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        title: Text(
                          '${state.languages[index].languageName} (${state.languages[index].languageCode})',
                          style: AppStyle.robotoRegular15
                              .copyWith(color: Colors.white),
                        ),
                        onTap: () {
                          context.read<TablesCubit>().addPreferedLanguage(
                                state.languages[index],
                              );
                          Navigator.pop(context);
                        },
                      );
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

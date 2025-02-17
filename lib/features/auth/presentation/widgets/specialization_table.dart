import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/features/auth/presentation/logic/tables_cubit/tables_cubit.dart';

import '../../../../core/utils/logic/meta_data_cubit/meta_data_cubit.dart';
import '../../../../core/utils/widgets/custom_failure_widget.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';

class SpecializationTable extends StatelessWidget {
  const SpecializationTable({super.key, this.darkColors = false});
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
              'Specialization',
              style: AppStyle.poppinsSemiBold14.copyWith(
                color: darkColors ? AppColors.black : AppColors.white,
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(4),
              onTap: () {
                _showSpecializationDialog(context);
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
                current.selectedSpecializations !=
                previous.selectedSpecializations,
            builder: (context, state) {
              return DataTable(
                columns: [
                  DataColumn(
                    label: Text(
                      'Specialization',
                      style: AppStyle.poppinsSemiBold14.copyWith(
                        color: darkColors ? AppColors.black : AppColors.white,
                      ),
                    ),
                  ),
                ],
                rows: state.selectedSpecializations.map((specialization) {
                  return DataRow(
                    cells: [
                      DataCell(
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<TablesCubit>()
                                    .removeSpecialization(specialization);
                              },
                              child: const HugeIcon(
                                icon:
                                    HugeIcons.strokeRoundedCancelCircleHalfDot,
                                color: Colors.red,
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              specialization.name,
                              style: TextStyle(
                                  color: darkColors
                                      ? AppColors.black
                                      : AppColors.white),
                            ),
                          ],
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

  _showSpecializationDialog(BuildContext context) {
    final tablesCubit = context.read<TablesCubit>();
    final metaDataCubit = context.read<MetaDataCubit>();

    showDialog(
      context: context,
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(value: tablesCubit),
            BlocProvider.value(value: metaDataCubit..getSpecializations()),
          ],
          child: AlertDialog(
            title: Text(
              'Select Specialization',
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
                    previous.specializations != current.specializations,
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
                    itemCount: state.specializations.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(color: Colors.white10, height: 0),
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        title: Text(
                          '${index + 1}. ${state.specializations[index].name}',
                          style: AppStyle.robotoRegular15
                              .copyWith(color: Colors.white),
                        ),
                        onTap: () {
                          tablesCubit.addSpecialization(
                            state.specializations[index],
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

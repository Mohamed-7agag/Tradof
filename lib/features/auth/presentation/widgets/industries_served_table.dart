import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../../../core/utils/logic/meta_data_cubit/meta_data_cubit.dart';
import '../../../../core/utils/widgets/custom_failure_widget.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../core/utils/logic/tables_cubit/tables_cubit.dart';

class IndustriesServedTable extends StatelessWidget {
  const IndustriesServedTable({super.key, this.darkColors = false});
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
              'Industries Served',
              style: AppStyle.poppinsSemiBold14.copyWith(
                  color: darkColors ? AppColors.black : AppColors.white),
            ),
            GestureDetector(
              onTap: () {
                if (context
                    .read<MetaDataCubit>()
                    .state
                    .specializations
                    .isEmpty) {
                  context.read<MetaDataCubit>().getSpecializations();
                }
                _showIndusteriesServedDialog(context);
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
                current.selectedIndustriesServed !=
                previous.selectedIndustriesServed,
            builder: (context, state) {
              return DataTable(
                columns: [
                  DataColumn(
                    label: Text(
                      'Industries Served',
                      style: AppStyle.poppinsSemiBold14.copyWith(
                        color: darkColors ? AppColors.black : AppColors.white,
                      ),
                    ),
                  ),
                ],
                rows: state.selectedIndustriesServed.map((industriesServed) {
                  return DataRow(
                    cells: [
                      DataCell(
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<TablesCubit>()
                                    .removeIndustryServed(industriesServed);
                              },
                              child: const HugeIcon(
                                icon:
                                    HugeIcons.strokeRoundedCancelCircleHalfDot,
                                color: Colors.red,
                                size: 18,
                              ),
                            ),
                            horizontalSpace(6),
                            Text(
                              industriesServed.name,
                              style: TextStyle(
                                color:
                                    darkColors ? AppColors.black : Colors.white,
                              ),
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

  _showIndusteriesServedDialog(BuildContext context) {
    final tablesCubit = context.read<TablesCubit>();

    showDialog(
      context: context,
      builder: (context) {
        return BlocProvider.value(
          value: tablesCubit,
          child: AlertDialog(
            title: Text(
              'Industries Served',
              style: AppStyle.poppinsBold22.copyWith(color: Colors.white),
            ),
            backgroundColor: AppColors.darkGrey,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(14)),
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
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        title: Text(
                          '${index + 1}. ${state.specializations[index].name}',
                          style: AppStyle.robotoRegular15
                              .copyWith(color: Colors.white),
                        ),
                        onTap: () {
                          tablesCubit.addIndustryServed(
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

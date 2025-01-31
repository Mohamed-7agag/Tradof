import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/core/utils/logic/meta_data_cubit/meta_data_cubit.dart';

import '../../data/model/specialization_model.dart';
import '../logic/tables_cubit/tables_cubit.dart';

class IndustriesServedTable extends StatelessWidget {
  const IndustriesServedTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Industries Served',
              style:
                  AppStyle.poppinsSemiBold14.copyWith(color: AppColors.white),
            ),
            GestureDetector(
              onTap: () {
                _showIndusteriesServedDialog(context);
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
                current.selectedIndustriesServed !=
                previous.selectedIndustriesServed,
            builder: (context, state) {
              return DataTable(
                columns: [
                  DataColumn(
                    label: Text(
                      'Industries Served',
                      style: AppStyle.poppinsSemiBold14.copyWith(
                        color: AppColors.white,
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
                              child: Icon(Icons.cancel, color: Colors.red),
                            ),
                            SizedBox(width: 6),
                            Text(
                              industriesServed.name,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
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

  _showIndusteriesServedDialog(BuildContext context) {
    final cubit = context.read<TablesCubit>();
    final List<SpecializationModel> industriesServed =
        context.read<MetaDataCubit>().state.specializations;
    showDialog(
      context: context,
      builder: (context) {
        return BlocProvider.value(
          value: cubit,
          child: AlertDialog(
            title: Text(
              'Industries Served',
              style: AppStyle.poppinsBold22.copyWith(color: Colors.white),
            ),
            backgroundColor: AppColors.darkGrey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            content: SizedBox(
              width: 0.9.sw,
              child: ListView.separated(
                itemCount: industriesServed.length,
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
                      '${index + 1}. ${industriesServed[index].name}',
                      style: AppStyle.robotoRegular15
                          .copyWith(color: Colors.white),
                    ),
                    onTap: () {
                      context.read<TablesCubit>().addIndustryServed(
                            industriesServed[index],
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

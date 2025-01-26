import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/features/auth/presentation/logic/cubit/create_account_cubit.dart';

class SpecializationTable extends StatefulWidget {
  const SpecializationTable({super.key});

  @override
  State<SpecializationTable> createState() => _SpecializationTableState();
}

class _SpecializationTableState extends State<SpecializationTable> {
  static final List<String> _availableSpecializations = [
    "Legal Translation",
    "Medical Translation",
    "Marketing Translation",
    "Technical Translation",
    "Financial Translation",
  ];

  List<String> _specializations = [];

  @override
  Widget build(BuildContext context) {
    CreateAccountCubit? cubit;
    try {
      cubit = context.read<CreateAccountCubit>();
      _specializations = cubit.specializations;
    } catch (e) {
      log('CreateAccountCubit not found, using local state');
    }

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: SizedBox(
                    height: 300.0,
                    width: 300.0,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _availableSpecializations.length,
                      itemBuilder: (BuildContext dialogContext, int index) {
                        final specialization = _availableSpecializations[index];
                        return ListTile(
                          title: Text(specialization),
                          onTap: () {
                            setState(() {
                              if (cubit != null) {
                               
                                cubit.addSpecialization(specialization);
                              } else if (!_specializations
                                  .contains(specialization)) {
                                 
                                _specializations.add(specialization);
                              }
                            });
                            log('Specializations added: $_specializations');
                            dialogContext.pop();
                          },
                        );
                      },
                    ),
                  ),
                );
              },
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Specialization',
                style:
                    AppStyle.poppinsSemiBold14.copyWith(color: AppColors.white),
              ),
              SvgPicture.asset('assets/images/add.svg', width: 25),
            ],
          ),
        ),
        verticalSpace(12),
        SizedBox(
          width: 1.sw,
          child: DataTable(
            columns: [
              DataColumn(
                label: Text(
                  'Specialization',
                  style: AppStyle.poppinsSemiBold14.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
            rows: _specializations.map((specialization) {
              return DataRow(
                cells: [
                  DataCell(
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (cubit != null) {
                                cubit.removeSpecialization(specialization);
                              } else {
                                _specializations.remove(specialization);
                              }
                            });
                          },
                          child: Icon(Icons.cancel, color: Colors.red),
                        ),
                        SizedBox(width: 6),
                        Text(
                          specialization,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
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
          ),
        ),
      ],
    );
  }
}

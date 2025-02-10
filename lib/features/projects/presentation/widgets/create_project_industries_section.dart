import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/features/auth/data/model/specialization_model.dart';

import '../../../company/company_profile/data/model/company_model.dart';
import '../logic/project_cubit/project_cubit.dart';

class CreateProjectIndustriesSection extends StatefulWidget {
  const CreateProjectIndustriesSection({
    super.key,
    required this.companyModel,
    this.value,
  });
  final CompanyModel companyModel;
  final SpecializationModel? value;

  @override
  State<CreateProjectIndustriesSection> createState() =>
      _CreateProjectIndustriesSectionState();
}

class _CreateProjectIndustriesSectionState
    extends State<CreateProjectIndustriesSection> {
  SpecializationModel? selectedIndustries;

  @override
  void initState() {
    selectedIndustries = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showIndustries(context, widget.companyModel);
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        width: 1.sw,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedIndustries != null
                  ? selectedIndustries!.name
                  : 'Choose Industries Served',
              style: selectedIndustries == null
                  ? AppStyle.robotoRegular12.copyWith(
                      color: AppColors.darkGrey,
                    )
                  : AppStyle.robotoRegular14.copyWith(
                      color: AppColors.darkGrey,
                    ),
            ),
            Icon(Icons.arrow_drop_down,color: AppColors.grey),
          ],
        ),
      ),
    );
  }

  _showIndustries(BuildContext context, CompanyModel companyModel) {
    final cubit = context.read<ProjectCubit>();
    showDialog(
      context: context,
      builder: (context) {
        return BlocProvider.value(
          value: cubit,
          child: AlertDialog(
            title: Text(
              'Industries Served',
              style: AppStyle.poppinsBold22,
            ),
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            content: SizedBox(
              width: 0.9.sw,
              height: 0.7.sh,
              child: ListView.separated(
                itemCount: companyModel.specializations.length,
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(color: Colors.white10, height: 0),
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    title: Text(
                      '${index + 1}. ${companyModel.specializations[index].name}',
                      style: AppStyle.robotoRegular15,
                    ),
                    onTap: () {
                      setState(() {
                        selectedIndustries =
                            companyModel.specializations[index];
                        context.read<ProjectCubit>().setCreateProjectData(
                              industryId: selectedIndustries!.id,
                            );
                      });
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

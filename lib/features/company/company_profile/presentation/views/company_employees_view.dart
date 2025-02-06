import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/routing/routes.dart';
import 'package:tradof/core/utils/widgets/custom_failure_widget.dart';
import 'package:tradof/core/utils/widgets/custom_loading_widget.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_style.dart';
import '../logic/company_profile_cubit/company_profile_cubit.dart';
import '../widgets/company_employee_item.dart';

class CompanyEmployeesView extends StatelessWidget {
  const CompanyEmployeesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        child: Icon(Icons.person_add, size: 26),
        onPressed: () async {
          final result = await context.pushNamed(
            Routes.companyAddEmployeeViewRoute,
          );
          if (result == true && context.mounted) {
            context.read<CompanyProfileCubit>().getCompanyEmployees();
          }
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: BlocBuilder<CompanyProfileCubit, CompanyProfileState>(
          builder: (context, state) {
            if (state.status.isGetCompanyEmployeesSuccess) {
              return ListView.builder(
                itemCount: state.companyEmployees.length,
                padding: EdgeInsets.symmetric(vertical: 10),
                itemBuilder: (BuildContext context, int index) {
                  return CompanyEmployeeItem(
                    employeeModel: state.companyEmployees[
                        state.companyEmployees.length - index - 1],
                  );
                },
              );
            } else if (state.status.isGetCompanyEmployeesFailure) {
              return CustomFailureWidget(text: state.errorMessage);
            }
            return CustomLoadingWidget();
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      leadingWidth: 40,
      title: Text(
        'Employees',
        style: AppStyle.robotoBold20,
      ),
      actions: [
        SvgPicture.asset(
          'assets/images/support.svg',
          width: 24,
          colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
        ),
        horizontalSpace(16),
      ],
      toolbarHeight: 65,
    );
  }
}

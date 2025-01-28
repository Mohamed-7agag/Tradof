import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/routing/routes.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/utils/widgets/custom_button.dart';
import 'package:tradof/core/utils/widgets/custom_drop_down_widget.dart';
import 'package:tradof/core/utils/widgets/custom_text_field.dart';
import 'package:tradof/features/auth/presentation/logic/tables_cubit/tables_cubit.dart';
import 'package:tradof/features/auth/presentation/widgets/create_account_curve_with_image.dart';
import 'package:tradof/features/auth/presentation/widgets/industries_served_table.dart';
import 'package:tradof/features/auth/presentation/widgets/prefered_languages_table.dart';

class CompanyRegisterView extends StatelessWidget {
  const CompanyRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TablesCubit(),
      child: Column(
        children: [
          CreateAccountCurveWithImage(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                CustomTextField(
                  labelText: 'Job Title',
                  labelColor: AppColors.white,
                  controller: TextEditingController(),
                  keyboardType: TextInputType.text,
                ),
                verticalSpace(16),
                CustomDropDownWidget(
                  hint: 'Country',
                  items: ['USA', 'UK', 'Canada'],
                  onChanged: (value) {},
                ),
                verticalSpace(16),
                CustomDropDownWidget(
                  hint: 'Location Company',
                  items: ['USA', 'UK', 'Canada'],
                  onChanged: (value) {},
                ),
                verticalSpace(32),
                PreferedLanguagesTable(),
                verticalSpace(32),
                IndustriesServedTable(),
                verticalSpace(40),
                CustomButton(
                  text: 'Submit',
                  color: AppColors.lightOrange,
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    context.pushNamed(Routes.verificationViewRoute);
                  },
                ),
                verticalSpace(20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

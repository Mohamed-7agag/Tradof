import 'package:animate_do/animate_do.dart';
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

class CompanyRegisterView extends StatefulWidget {
  const CompanyRegisterView({super.key});

  @override
  State<CompanyRegisterView> createState() => _CompanyRegisterViewState();
}

class _CompanyRegisterViewState extends State<CompanyRegisterView> {
  late final TextEditingController jobTitleController;
  @override
  void initState() {
    jobTitleController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    jobTitleController.dispose();
    super.dispose();
  }

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
                SlideInRight(
                  from: 400,
                  child: CustomTextField(
                    labelText: 'Job Title',
                    labelColor: AppColors.white,
                    controller: jobTitleController,
                    keyboardType: TextInputType.text,
                    outlineBorder: true,
                  ),
                ),
                verticalSpace(12),
                SlideInRight(
                  from: 400,
                  delay: Duration(milliseconds: 125),
                  child: CustomDropDownWidget(
                    hint: 'Country',
                    items: ['USA', 'UK', 'Canada'],
                    onChanged: (value) {},
                  ),
                ),
                verticalSpace(12),
                SlideInRight(
                  from: 400,
                  delay: Duration(milliseconds: 250),
                  child: CustomDropDownWidget(
                    hint: 'Location Company',
                    items: ['USA', 'UK', 'Canada'],
                    onChanged: (value) {},
                  ),
                ),
                verticalSpace(28),
                SlideInLeft(
                  from: 400,
                  delay: Duration(milliseconds: 375),
                  child: PreferedLanguagesTable(),
                ),
                verticalSpace(28),
                SlideInLeft(
                  from: 400,
                  delay: Duration(milliseconds: 500),
                  child: IndustriesServedTable(),
                ),
                verticalSpace(40),
                SlideInUp(
                  from: 400,
                  delay: Duration(milliseconds: 625),
                  child: CustomButton(
                    text: 'Submit',
                    color: AppColors.lightOrange,
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      context.pushNamed(Routes.verificationViewRoute);
                    },
                  ),
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

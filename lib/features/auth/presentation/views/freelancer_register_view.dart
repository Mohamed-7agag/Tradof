import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/features/auth/presentation/logic/registeration_cubit/registeration_cubit.dart';
import 'package:tradof/features/auth/presentation/logic/tables_cubit/tables_cubit.dart';
import 'package:tradof/features/auth/presentation/widgets/country_drop_down.dart';
import 'package:tradof/features/auth/presentation/widgets/create_account_curve_with_image.dart';
import 'package:tradof/features/auth/presentation/widgets/language_pair_table.dart';
import 'package:tradof/features/auth/presentation/widgets/specialization_table.dart';

import '../widgets/freelancer_registeration_button.dart';

class FreelancerRegisterView extends StatefulWidget {
  const FreelancerRegisterView({super.key});

  @override
  State<FreelancerRegisterView> createState() => _FreelancerRegisterViewState();
}

class _FreelancerRegisterViewState extends State<FreelancerRegisterView> {
  int? countryId;
  XFile? imagePicked;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TablesCubit(),
      child: Column(
        children: [
          CreateAccountCurveWithImage(
              onImagePicked: (image) => imagePicked = image),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                SlideInRight(
                  from: 400,
                  child: CountryDropDown(
                    hint: 'Country',
                    items: context.read<RegisterationCubit>().state.countries,
                    onChanged: (value) {
                      countryId = value?.id;
                    },
                  ),
                ),
                verticalSpace(28),
                SlideInLeft(
                  from: 400,
                  delay: Duration(milliseconds: 125),
                  child: LanguagePairTable(),
                ),
                verticalSpace(28),
                SlideInLeft(
                  from: 400,
                  delay: Duration(milliseconds: 250),
                  child: SpecializationTable(),
                ),
                verticalSpace(42),
                SlideInUp(
                  from: 400,
                  delay: Duration(milliseconds: 375),
                  child: FreelancerRegisterationButton(
                    countryId: countryId,
                    imageFile: imagePicked,
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

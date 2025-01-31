import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/utils/logic/meta_data_cubit/meta_data_cubit.dart';
import 'package:tradof/core/utils/widgets/custom_loading_dialog.dart';
import 'package:tradof/features/auth/presentation/logic/tables_cubit/tables_cubit.dart';
import 'package:tradof/features/auth/presentation/widgets/country_drop_down_section.dart';
import 'package:tradof/features/auth/presentation/widgets/language_pair_table.dart';
import 'package:tradof/features/auth/presentation/widgets/specialization_table.dart';

import '../../../../core/utils/widgets/custom_toastification.dart';
import '../logic/freelancer_registeration_cubit.dart';
import '../widgets/freelancer_registeration_button.dart';
import '../widgets/profile_image_section.dart';

class FreelancerRegisterView extends StatefulWidget {
  const FreelancerRegisterView({super.key});

  @override
  State<FreelancerRegisterView> createState() => _FreelancerRegisterViewState();
}

class _FreelancerRegisterViewState extends State<FreelancerRegisterView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => loadingDialog(context));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TablesCubit()),
        BlocProvider(create: (context) => ProfileImageAndCountryCubit()),
      ],
      child: BlocListener<MetaDataCubit, MetaDataState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status.isError) {
            context.pop();
            context.pop();
            errorToast(context, 'Error', state.errorMessage);
          } else if (state.languages.isNotEmpty &&
              state.countries.isNotEmpty &&
              state.specializations.isNotEmpty) {
            context.pop();
          }
        },
        child: Column(
          children: [
            ProfileImageSection(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  CountryDropDownSection(),
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
                  BlocBuilder<ProfileImageAndCountryCubit,
                      ProfileImageAndCountryState>(
                    builder: (context, state) {
                      return SlideInUp(
                        from: 400,
                        delay: Duration(milliseconds: 375),
                        child: FreelancerRegisterationButton(
                          countryId: state.countryId,
                          imageUrl: state.imagePicked,
                        ),
                      );
                    },
                  ),
                  verticalSpace(20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/utils/logic/meta_data_cubit/meta_data_cubit.dart';
import 'package:tradof/features/auth/presentation/logic/freelancer_registeration_cubit.dart';
import 'package:tradof/features/auth/presentation/widgets/country_drop_down.dart';
import 'package:tradof/features/company/profile_company/presentation/widgets/country_drop_down_with_edit.dart';



class CountryDropDownEdit extends StatelessWidget {
  const CountryDropDownEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileImageAndCountryCubit,
        ProfileImageAndCountryState>(
      buildWhen: (previous, current) => previous.countryId != current.countryId,
      builder: (context, state) {
        return BlocBuilder<MetaDataCubit, MetaDataState>(
          buildWhen: (previous, current) =>
              previous.countries != current.countries,
          builder: (context, state) {
            return CountryDropDownWithEdit(
              hint: 'Country',
              items: state.countries,
              onChanged: (value) {
                context
                    .read<ProfileImageAndCountryCubit>()
                    .onCountrySelected(value?.id);
              },
            );
          },
        );
      },
    );
  }
}

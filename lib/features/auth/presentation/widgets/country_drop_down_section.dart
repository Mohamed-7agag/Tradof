import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/utils/logic/meta_data_cubit/meta_data_cubit.dart';

import '../logic/freelancer_registeration_cubit.dart';
import 'country_drop_down.dart';

class CountryDropDownSection extends StatelessWidget {
  const CountryDropDownSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileImageAndCountryCubit,
        ProfileImageAndCountryState>(
      buildWhen: (previous, current) => previous.countryId != current.countryId,
      builder: (context, state) {
        return SlideInRight(
          from: 400,
          child: CountryDropDown(
            hint: 'Country',
            items: context.read<MetaDataCubit>().state.countries,
            onChanged: (value) {
              context
                  .read<ProfileImageAndCountryCubit>()
                  .onCountrySelected(value?.id);
            },
          ),
        );
      },
    );
  }
}

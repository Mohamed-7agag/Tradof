import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/logic/meta_data_cubit/meta_data_cubit.dart';
import '../logic/registeration_cubit/registeration_cubit.dart';
import 'country_drop_down.dart';

class CountryDropDownSection extends StatelessWidget {
  const CountryDropDownSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MetaDataCubit, MetaDataState>(
      buildWhen: (previous, current) => previous.countries != current.countries,
      builder: (context, state) {
        return CountryDropDown(
          hint: 'Country',
          items: state.countries,
          onChanged: (value) {
            context
                .read<RegisterationCubit>()
                .setCountryAndImageProfile(countryId: value?.id);
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/utils/logic/meta_data_cubit/meta_data_cubit.dart';
import 'package:tradof/core/utils/models/country_model.dart';
import 'package:tradof/core/utils/widgets/custom_loading_widget.dart';
import 'package:tradof/features/auth/presentation/widgets/country_drop_down.dart';

import '../../../../../core/utils/widgets/custom_failure_widget.dart';

class CountryDropDownEdit extends StatelessWidget {
  const CountryDropDownEdit({
    super.key,
    this.initialCountryId,
    this.countryName,
    this.onChanged,
  });

  final int? initialCountryId;
  final String? countryName;
  final void Function(CountryModel?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MetaDataCubit, MetaDataState>(
      buildWhen: (previous, current) => previous.countries != current.countries,
      builder: (context, state) {
        if (state.status.isLoading) {
          return const CustomLoadingWidget();
        } else if (state.status.isError) {
          return CustomFailureWidget(text: state.errorMessage);
        }
        return CountryDropDown(
          hint: 'Country',
          items: state.countries,
          borderColor: AppColors.grey,
          dropdownColor: AppColors.white,
          iconColor: AppColors.darkGrey,
          textColor: AppColors.darkGrey,
          value: countryName != null
              ? _createCountry(initialCountryId!, countryName!)
              : _getCountryById(state.countries, initialCountryId),
          onChanged: onChanged,
        );
      },
    );
  }

  CountryModel? _getCountryById(
      List<CountryModel> countries, int? initialCountryId) {
    if (initialCountryId != null) {
      for (var country in countries) {
        if (country.id == initialCountryId) {
          return country;
        }
      }
    }
    return null;
  }

  CountryModel? _createCountry(int id, String countryName) {
    return CountryModel(id: id, name: countryName);
  }
}

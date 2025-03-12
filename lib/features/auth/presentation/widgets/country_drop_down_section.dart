import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/utils/logic/meta_data_cubit/meta_data_cubit.dart';
import '../../../../core/utils/widgets/custom_failure_widget.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../logic/registeration_cubit/registeration_cubit.dart';
import 'country_drop_down.dart';

class CountryDropDownSection extends StatefulWidget {
  const CountryDropDownSection({super.key});

  @override
  State<CountryDropDownSection> createState() => _CountryDropDownSectionState();
}

class _CountryDropDownSectionState extends State<CountryDropDownSection> {
  @override
  void initState() {
    if (context.read<MetaDataCubit>().state.countries.isEmpty) {
      context.read<MetaDataCubit>().getCountries();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MetaDataCubit, MetaDataState>(
      buildWhen: (previous, current) => previous.countries != current.countries,
      builder: (context, state) {
        if (state.status.isLoading) {
          return const CustomLoadingWidget(
            color: AppColors.white,
          );
        } else if (state.status.isError) {
          return CustomFailureWidget(
            text: state.errorMessage,
            textColor: AppColors.white,
          );
        }
        return CountryDropDown(
          hint: 'Country',
          items: state.countries,
          onChanged: (value) {
            context
                .read<RegisterationCubit>()
                .setRegisterationData(countryId: value?.id);
          },
        );
      },
    );
  }
}

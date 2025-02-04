import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/utils/logic/meta_data_cubit/meta_data_cubit.dart';
import 'package:tradof/features/auth/data/model/country_model.dart';
import 'package:tradof/features/auth/presentation/logic/freelancer_registeration_cubit.dart';
import 'package:tradof/features/company/profile_company/presentation/widgets/country_drop_down_with_edit.dart';

class CountryDropDownEdit extends StatefulWidget {
  const CountryDropDownEdit({
    super.key,
    this.initialCountryId,
  });

  final int? initialCountryId;

  @override
  State<CountryDropDownEdit> createState() => _CountryDropDownEditState();
}

class _CountryDropDownEditState extends State<CountryDropDownEdit> {
  CountryModel? _initialCountry;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();

    // Delay initialization to ensure MetaDataState is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeCountry();
    });
  }

  void _initializeCountry() {
    final metaState = context.read<MetaDataCubit>().state;

    // Check if countries are loaded
    if (metaState.countries.isEmpty) {
      // If countries are not loaded, retry after a short delay
      Future.delayed(const Duration(milliseconds: 500), _initializeCountry);
      return;
    }

    // Find the initial country if initialCountryId is provided
    if (widget.initialCountryId != null) {
      try {
        _initialCountry = metaState.countries.firstWhere(
          (country) => country.id == widget.initialCountryId,
        );

        // Trigger country selection in the cubit
        context
            .read<ProfileImageAndCountryCubit>()
            .onCountrySelected(widget.initialCountryId);

        // Force rebuild to show initial country
        setState(() {
          _isInitialized = true;
        });
      } catch (e) {
        print('No country found for ID: ${widget.initialCountryId}');
        // Fallback to first country if initial country not found
        if (metaState.countries.isNotEmpty) {
          _initialCountry = metaState.countries.first;
          context
              .read<ProfileImageAndCountryCubit>()
              .onCountrySelected(_initialCountry!.id);

          setState(() {
            _isInitialized = true;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MetaDataCubit, MetaDataState>(
      buildWhen: (previous, current) => previous.countries != current.countries,
      builder: (context, metaState) {
        // If countries are not loaded, show a placeholder
        if (metaState.countries.isEmpty) {
          return const SizedBox(
            height: 50,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        // If no initial country is set, use the first country
        if (!_isInitialized && metaState.countries.isNotEmpty) {
          _initialCountry = metaState.countries.first;
        }

        return CountryDropDownWithEdit(
          hint: 'Country',
          items: metaState.countries,
          value: _initialCountry,
          onChanged: (value) {
            context
                .read<ProfileImageAndCountryCubit>()
                .onCountrySelected(value?.id);
          },
        );
      },
    );
  }
}

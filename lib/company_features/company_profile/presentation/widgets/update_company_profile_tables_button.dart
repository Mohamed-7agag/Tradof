import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/utils/models/language_model.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../../../../shared_features/auth/data/model/specialization_model.dart';
import '../../../../shared_features/auth/presentation/logic/tables_cubit/tables_cubit.dart';
import '../../data/model/company_model.dart';
import '../logic/company_profile_cubit/company_profile_cubit.dart';

class UpdateCompanyProfileTablesButton extends StatelessWidget {
  const UpdateCompanyProfileTablesButton({
    required this.companyModel,
    required this.isPreferedLanguages,
    super.key,
  });
  final CompanyModel companyModel;
  final bool isPreferedLanguages;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyProfileCubit, CompanyProfileState>(
      listenWhen: (previous, current) => _listenAndBuildWhen(current),
      buildWhen: (previous, current) => _listenAndBuildWhen(current),
      listener: (context, state) {
        if (state.status.isPreferedLanguagesFailure ||
            state.status.isIndustriesServedFailure) {
          errorToast(context, 'Error', state.errorMessage);
        } else if (state.status.isPreferedLanguagesSuccess ||
            state.status.isIndustriesServedSuccess) {
          successToast(context, 'Success', state.message);
          context.pop(result: true);
        }
      },
      builder: (context, state) {
        return BlocBuilder<TablesCubit, TablesState>(
          buildWhen: (previous, current) =>
              _buildWhenTablesCubit(current, previous),
          builder: (context, tablesState) {
            return (state.status.isPreferedLanguagesLoading ||
                    state.status.isIndustriesServedLoading)
                ? const CustomLoadingWidget()
                : CustomButton(
                    text: 'Update',
                    onPressed: () {
                      if (isPreferedLanguages) {
                        _updatePreferedLanguages(
                          context,
                          tablesState.selectedPreferedLanguages,
                          companyModel.preferredLanguages,
                        );
                      } else {
                        _updateIndustriesServed(
                          context,
                          tablesState.selectedIndustriesServed,
                          companyModel.specializations,
                        );
                      }
                    },
                  );
          },
        );
      },
    );
  }

  bool _buildWhenTablesCubit(TablesState current, TablesState previous) {
    return current.selectedPreferedLanguages !=
            previous.selectedPreferedLanguages ||
        current.selectedIndustriesServed != previous.selectedIndustriesServed;
  }

  bool _listenAndBuildWhen(CompanyProfileState current) {
    return current.status.isPreferedLanguagesFailure ||
        current.status.isIndustriesServedFailure ||
        current.status.isPreferedLanguagesSuccess ||
        current.status.isIndustriesServedSuccess ||
        current.status.isPreferedLanguagesLoading ||
        current.status.isIndustriesServedLoading;
  }

  void _updatePreferedLanguages(
      BuildContext context,
      List<LanguageModel> newPreferedLanguages,
      List<LanguageModel> oldPreferedLanguages) {
    if (newPreferedLanguages.isNotEmpty) {
      final addedItems = newPreferedLanguages
          .where((item) => !oldPreferedLanguages.contains(item));
      final removedItems = oldPreferedLanguages
          .where((item) => !newPreferedLanguages.contains(item));
      if (addedItems.isEmpty && removedItems.isEmpty) {
        infoToast(context, 'Info', 'No changes detected');
        return;
      }
      final addedLanguagesIds = addedItems.map((item) => item.id).toList();
      final deletedLanguagesIds = removedItems.map((item) => item.id).toList();
      context.read<CompanyProfileCubit>().updatePreferredLanguages(
            addedLanguagesIds: addedLanguagesIds,
            deletedLanguagesIds: deletedLanguagesIds,
          );
    } else {
      errorToast(
        context,
        'Error',
        'Please select at least one prefered language',
      );
    }
  }

  void _updateIndustriesServed(
      BuildContext context,
      List<SpecializationModel> newIndustries,
      List<SpecializationModel> oldIndustries) {
    if (newIndustries.isNotEmpty) {
      final addedItems =
          newIndustries.where((item) => !oldIndustries.contains(item));
      final removedItems =
          oldIndustries.where((item) => !newIndustries.contains(item));
      if (addedItems.isEmpty && removedItems.isEmpty) {
        infoToast(context, 'Info', 'No changes detected');
        return;
      }
      final addedIndustriesIds = addedItems.map((item) => item.id).toList();
      final deletedIndustriesIds = removedItems.map((item) => item.id).toList();

      context.read<CompanyProfileCubit>().updateIndustriesServed(
            addedIndustriesIds: addedIndustriesIds,
            deletedIndustriesIds: deletedIndustriesIds,
          );
    } else {
      errorToast(
        context,
        'Error',
        'Please select at least one industry served',
      );
    }
  }
}

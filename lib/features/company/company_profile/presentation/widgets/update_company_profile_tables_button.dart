import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/utils/widgets/custom_loading_widget.dart';
import 'package:tradof/features/auth/data/model/specialization_model.dart';
import 'package:tradof/features/auth/presentation/logic/tables_cubit/tables_cubit.dart';
import 'package:tradof/features/company/company_profile/data/model/company_model.dart';

import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../../../core/utils/widgets/custom_toastification.dart';
import '../../../../../core/utils/models/language_model.dart';
import '../logic/company_profile_cubit/company_profile_cubit.dart';

class UpdateCompanyProfileTablesButton extends StatelessWidget {
  const UpdateCompanyProfileTablesButton({
    super.key,
    required this.companyModel,
  });
  final CompanyModel companyModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyProfileCubit, CompanyProfileState>(
      listener: (context, state) {
        if (state.status.isPreferedLanguagesFailure ||
            state.status.isIndustriesServedFailure) {
          errorToast(context, 'Error', state.errorMessage);
        } else if (state.status.isPreferedLanguagesSuccess ||
            state.status.isIndustriesServedSuccess) {
          successToast(context, 'Success', state.message);
          GoRouter.of(context).pop(true);
        }
      },
      builder: (context, state) {
        return BlocBuilder<TablesCubit, TablesState>(
          buildWhen: (previous, current) =>
              current.selectedPreferedLanguages !=
                  previous.selectedPreferedLanguages ||
              current.selectedIndustriesServed !=
                  previous.selectedIndustriesServed,
          builder: (context, tablesState) {
            return (state.status.isPreferedLanguagesLoading ||
                    state.status.isIndustriesServedLoading)
                ? CustomLoadingWidget()
                : CustomButton(
                    text: 'Update',
                    onPressed: () {
                      if (tablesState.selectedPreferedLanguages !=
                          companyModel.preferredLanguages) {
                        _getDifferencePreferedLanguagesList(
                          context,
                          tablesState.selectedPreferedLanguages,
                          companyModel.preferredLanguages,
                        );
                      }
                      if (tablesState.selectedIndustriesServed !=
                          companyModel.specializations) {
                        _getDifferenceIndustriesServedList(
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

  void _getDifferencePreferedLanguagesList(BuildContext context,
      List<LanguageModel> newList, List<LanguageModel> oldList) {
    if (!newList.isNullOrEmpty()) {
      final addedItems = newList.where((item) => !oldList.contains(item));
      final removedItems = oldList.where((item) => !newList.contains(item));
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
          context, 'Error', 'Please select at least one prefered language');
    }
  }

  void _getDifferenceIndustriesServedList(BuildContext context,
      List<SpecializationModel> newList, List<SpecializationModel> oldList) {
    if (!newList.isNullOrEmpty()) {
      final addedItems = newList.where((item) => !oldList.contains(item));
      final removedItems = oldList.where((item) => !newList.contains(item));
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
          context, 'Error', 'Please select at least one industry served');
    }
  }
}

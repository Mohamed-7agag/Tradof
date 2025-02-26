import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/convert_freelancer_language_pair_to_language_pair.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/utils/models/language_pair_model.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../../../../shared_features/auth/data/model/specialization_model.dart';
import '../../../../shared_features/auth/presentation/logic/tables_cubit/tables_cubit.dart';
import '../../data/model/freelancer_langauge_pair_model.dart';
import '../../data/model/freelancer_model.dart';
import '../logic/freelancer_profile_cubit/freelancer_profile_cubit.dart';

class UpdateFreelancerProfileTablesButton extends StatelessWidget {
  const UpdateFreelancerProfileTablesButton({
    required this.freelancerModel,
    required this.islanguagePair,
    super.key,
  });
  final FreelancerModel freelancerModel;
  final bool islanguagePair;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FreelancerProfileCubit, FreelancerProfileState>(
      listenWhen: (previous, current) => _listenAndBuildWhen(current),
      buildWhen: (previous, current) => _listenAndBuildWhen(current),
      listener: (context, state) {
        if (state.status.isLanguagePairFailure ||
            state.status.isSpecializationFailure) {
          errorToast(context, 'Error', state.errMessage);
        } else if (state.status.isLanguagePairSuccess ||
            state.status.isSpecializationSuccess) {
          successToast(context, 'Success', state.message);
          context.pop(result: true);
        }
      },
      builder: (context, state) {
        return BlocBuilder<TablesCubit, TablesState>(
          buildWhen: (previous, current) =>
              _buildWhenTablesCubit(current, previous),
          builder: (context, tablesState) {
            return (state.status.isLanguagePairLoading ||
                    state.status.isSpecializationLoading)
                ? const CustomLoadingWidget()
                : CustomButton(
                    text: 'Update',
                    onPressed: () {
                      if (islanguagePair) {
                        _updateLanguagePairs(
                          context,
                          tablesState.selectedLanguagePair,
                          freelancerModel.languagePairs,
                        );
                      } else {
                        _updateSpecializations(
                          context,
                          tablesState.selectedSpecializations,
                          freelancerModel.specializations,
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
    return current.selectedLanguagePair != previous.selectedLanguagePair ||
        current.selectedSpecializations != previous.selectedSpecializations;
  }

  bool _listenAndBuildWhen(FreelancerProfileState current) {
    return current.status.isLanguagePairFailure ||
        current.status.isSpecializationFailure ||
        current.status.isLanguagePairSuccess ||
        current.status.isSpecializationSuccess ||
        current.status.isLanguagePairLoading ||
        current.status.isSpecializationLoading;
  }

  void _updateLanguagePairs(
      BuildContext context,
      List<LanguagePairModel> newLanguagePairs,
      List<FreelancerLangaugePairModel> oldLanguagePairs) {
    if (newLanguagePairs.isNotEmpty) {
      final convertedOldList = convertLanguagePairs(oldLanguagePairs);
      final addedItems =
          newLanguagePairs.where((item) => !convertedOldList.contains(item));
      final removedItems =
          convertedOldList.where((item) => !newLanguagePairs.contains(item));
      if (addedItems.isEmpty && removedItems.isEmpty) {
        infoToast(context, 'Info', 'No changes detected');
        return;
      }
      final addedLanguagePairsIds = addedItems
          .map((item) => {
                'languageFromId': item.fromLanguage.id,
                'languageToId': item.toLanguage.id
              })
          .toList();
      final deletedLanguagePairsIds =
          removedItems.map((item) => item.id!).toList();

      context.read<FreelancerProfileCubit>().updateLanguagePairs(
            addedLanguagePairsIds: addedLanguagePairsIds,
            deletedLanguagePairsIds: deletedLanguagePairsIds,
          );
    } else {
      errorToast(context, 'Error', 'Please select at least one Language Pair');
    }
  }

  void _updateSpecializations(
      BuildContext context,
      List<SpecializationModel> newSpecializations,
      List<SpecializationModel> oldSpecializations) {
    if (newSpecializations.isNotEmpty) {
      final addedItems = newSpecializations
          .where((item) => !oldSpecializations.contains(item));
      final removedItems = oldSpecializations
          .where((item) => !newSpecializations.contains(item));
      if (addedItems.isEmpty && removedItems.isEmpty) {
        infoToast(context, 'Info', 'No changes detected');
        return;
      }
      final addedSpecializationIds = addedItems.map((item) => item.id).toList();
      final deletedSpecializationIds =
          removedItems.map((item) => item.id).toList();

      context.read<FreelancerProfileCubit>().updateSpecialization(
            addedSpecializationIds: addedSpecializationIds,
            deletedSpecializationIds: deletedSpecializationIds,
          );
    } else {
      errorToast(context, 'Error', 'Please select at least one Specialization');
    }
  }
}

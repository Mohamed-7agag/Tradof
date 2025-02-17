import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/convert_freelancer_language_pair_to_language_pair.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/utils/models/language_pair_model.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../../core/utils/widgets/custom_toastification.dart';
import '../../../../auth/data/model/specialization_model.dart';
import '../../../../auth/presentation/logic/tables_cubit/tables_cubit.dart';
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
              current.selectedLanguagePair != previous.selectedLanguagePair ||
              current.selectedSpecializations !=
                  previous.selectedSpecializations,
          builder: (context, tablesState) {
            return (state.status.isLanguagePairLoading ||
                    state.status.isSpecializationLoading)
                ? const CustomLoadingWidget()
                : CustomButton(
                    text: 'Update',
                    onPressed: () {
                      if (islanguagePair) {
                        _getDifferenceLanguagePairsList(
                          context,
                          tablesState.selectedLanguagePair,
                          freelancerModel.languagePairs,
                        );
                      } else {
                        _getDifferenceSpecializationList(
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

  bool _listenAndBuildWhen(FreelancerProfileState current) {
    return current.status.isLanguagePairFailure ||
        current.status.isSpecializationFailure ||
        current.status.isLanguagePairSuccess ||
        current.status.isSpecializationSuccess ||
        current.status.isLanguagePairLoading ||
        current.status.isSpecializationLoading;
  }

  void _getDifferenceLanguagePairsList(
      BuildContext context,
      List<LanguagePairModel> newList,
      List<FreelancerLangaugePairModel> oldList) {
    if (!newList.isNullOrEmpty()) {
      final convertedOldList = convertLanguagePairs(oldList);
      final addedItems =
          newList.where((item) => !convertedOldList.contains(item));
      final removedItems =
          convertedOldList.where((item) => !newList.contains(item));
      if (addedItems.isEmpty && removedItems.isEmpty) {
        infoToast(context, 'Info', 'No changes detected');
        log('from first');
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

  void _getDifferenceSpecializationList(BuildContext context,
      List<SpecializationModel> newList, List<SpecializationModel> oldList) {
    if (!newList.isNullOrEmpty()) {
      final addedItems = newList.where((item) => !oldList.contains(item));
      final removedItems = oldList.where((item) => !newList.contains(item));
      log('addedItems: $addedItems');
      log('removedItems: $removedItems');
      if (addedItems.isEmpty && removedItems.isEmpty) {
        infoToast(context, 'Info', 'No changes detected');
        log('from Second');
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

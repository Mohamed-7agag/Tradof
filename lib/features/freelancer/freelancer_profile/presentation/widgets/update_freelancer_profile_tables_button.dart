import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/helpers/convert_freelancer_language_pair_to_language_pair.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/utils/widgets/custom_loading_widget.dart';
import 'package:tradof/features/auth/data/model/specialization_model.dart';
import 'package:tradof/features/auth/presentation/logic/tables_cubit/tables_cubit.dart';
import 'package:tradof/features/freelancer/freelancer_profile/presentation/logic/freelancer_profile_cubit/freelancer_profile_cubit.dart';

import '../../../../../core/utils/models/language_pair_model.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../../../core/utils/widgets/custom_toastification.dart';
import '../../data/model/freelancer_langauge_pair_model.dart';
import '../../data/model/freelancer_model.dart';

class UpdateFreelancerProfileTablesButton extends StatelessWidget {
  const UpdateFreelancerProfileTablesButton({
    super.key,
    required this.freelancerModel,
  });
  final FreelancerModel freelancerModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FreelancerProfileCubit, FreelancerProfileState>(
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
                ? CustomLoadingWidget()
                : CustomButton(
                    text: 'Update',
                    onPressed: () {
                      if (tablesState.selectedLanguagePair !=
                          freelancerModel.languagePairs) {
                        _getDifferenceLanguagePairsList(
                          context,
                          tablesState.selectedLanguagePair,
                          freelancerModel.languagePairs,
                        );
                      }
                      if (tablesState.selectedSpecializations !=
                          freelancerModel.specializations) {
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
        return;
      }
      final addedLanguagePairsIds = addedItems
          .map((item) => {
                'languageFromId': item.fromLanguage.id,
                'languageToId': item.toLanguage.id
              })
          .toList();
      final deletedLanguagePairsIds = removedItems
          .map((item) => {
                'languageFromId': item.fromLanguage.id,
                'languageToId': item.toLanguage.id
              })
          .toList();

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

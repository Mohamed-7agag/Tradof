import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/convert_freelancer_language_pair_to_language_pair.dart';
import '../../../../../core/utils/models/language_model.dart';
import '../../../../../core/utils/models/language_pair_model.dart';
import '../../../../../freelancer_features/freelancer_profile/data/model/freelancer_langauge_pair_model.dart';
import '../../../data/model/specialization_model.dart';

part 'tables_state.dart';

class TablesCubit extends Cubit<TablesState> {
  TablesCubit() : super(TablesState());

  void addInitialData({
    List<SpecializationModel>? specializations,
    List<FreelancerLangaugePairModel>? freelancerLanguagePairs,
    List<LanguageModel>? preferedLanguages,
    List<SpecializationModel>? industriesServed,
  }) {
    emit(state.copyWith(
      selectedSpecializations: specializations,
      selectedLanguagePair: convertLanguagePairs(freelancerLanguagePairs),
      selectedPreferedLanguages: preferedLanguages,
      selectedIndustriesServed: industriesServed,
    ));
  }

  //! Specialization
  void addSpecialization(SpecializationModel specialization) {
    if (!state.selectedSpecializations.contains(specialization)) {
      final updatedList =
          List<SpecializationModel>.from(state.selectedSpecializations)
            ..add(specialization);
      emit(state.copyWith(selectedSpecializations: updatedList));
    }
  }

  void removeSpecialization(SpecializationModel specialization) {
    final updatedList =
        List<SpecializationModel>.from(state.selectedSpecializations)
          ..remove(specialization);
    emit(state.copyWith(selectedSpecializations: updatedList));
  }

  //! Industries Served
  void addIndustryServed(SpecializationModel industry) {
    if (!state.selectedIndustriesServed.contains(industry)) {
      final updatedList =
          List<SpecializationModel>.from(state.selectedIndustriesServed)
            ..add(industry);
      emit(state.copyWith(selectedIndustriesServed: updatedList));
    }
  }

  void removeIndustryServed(SpecializationModel industry) {
    final updatedList =
        List<SpecializationModel>.from(state.selectedIndustriesServed)
          ..remove(industry);
    emit(state.copyWith(selectedIndustriesServed: updatedList));
  }

  //! Prefered Languages
  void addPreferedLanguage(LanguageModel language) {
    if (!state.selectedPreferedLanguages.contains(language)) {
      final updatedList =
          List<LanguageModel>.from(state.selectedPreferedLanguages)
            ..add(language);
      emit(state.copyWith(selectedPreferedLanguages: updatedList));
    }
  }

  void removePreferedLanguage(LanguageModel language) {
    final updatedList =
        List<LanguageModel>.from(state.selectedPreferedLanguages)
          ..remove(language);
    emit(state.copyWith(selectedPreferedLanguages: updatedList));
  }

  //! Language Pair
  void addLanguagePair(LanguagePairModel languagePair) {
    if (!state.selectedLanguagePair.contains(languagePair)) {
      final updatedList =
          List<LanguagePairModel>.from(state.selectedLanguagePair)
            ..add(languagePair);
      emit(state.copyWith(selectedLanguagePair: updatedList));
    }
  }

  void removeLanguagePair(LanguagePairModel languagePair) {
    final updatedList = List<LanguagePairModel>.from(state.selectedLanguagePair)
      ..remove(languagePair);
    emit(state.copyWith(selectedLanguagePair: updatedList));
  }
}

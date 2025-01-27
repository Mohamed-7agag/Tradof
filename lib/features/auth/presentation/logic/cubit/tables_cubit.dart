import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/features/auth/data/model/language_model.dart';

part 'tables_state.dart';

class TablesCubit extends Cubit<TablesState> {
  TablesCubit() : super(TablesState());

  //! Specialization
  void addSpecialization(String specialization) {
    if (!state.selectedSpecializations.contains(specialization)) {
      final updatedList = List<String>.from(state.selectedSpecializations)
        ..add(specialization);
      emit(state.copyWith(selectedSpecializations: updatedList));
    }
  }

  void removeSpecialization(String specialization) {
    final updatedList = List<String>.from(state.selectedSpecializations)
      ..remove(specialization);
    emit(state.copyWith(selectedSpecializations: updatedList));
  }

  //! Industries Served
  void addIndustryServed(String industry) {
    if (!state.selectedIndustriesServed.contains(industry)) {
      final updatedList = List<String>.from(state.selectedIndustriesServed)
        ..add(industry);
      emit(state.copyWith(selectedIndustriesServed: updatedList));
    }
  }

  void removeIndustryServed(String industry) {
    final updatedList = List<String>.from(state.selectedIndustriesServed)
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
  void addLanguagePair(LanguageModel language) {
    if (!state.selectedLanguagePair.contains(language)) {
      final updatedList = List<LanguageModel>.from(state.selectedLanguagePair)
        ..add(language);
      emit(state.copyWith(selectedLanguagePair: updatedList));
    }
  }

  void removeLanguagePair(LanguageModel language) {
    final updatedList = List<LanguageModel>.from(state.selectedLanguagePair)
      ..remove(language);
    emit(state.copyWith(selectedLanguagePair: updatedList));
  }
}

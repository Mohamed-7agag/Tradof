import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/features/auth/data/model/language_model.dart';

part 'tables_state.dart';

class TablesCubit extends Cubit<TablesState> {
  TablesCubit() : super(TablesState());

  // Add specialization
  void addSpecialization(String specialization) {
    final updatedList = List<String>.from(state.selectedSpecializations)
      ..add(specialization);
    emit(state.copyWith(selectedSpecializations: updatedList));
  }

  // Remove specialization
  void removeSpecialization(String specialization) {
    final updatedList = List<String>.from(state.selectedSpecializations)
      ..remove(specialization);
    emit(state.copyWith(selectedSpecializations: updatedList));
  }

  // Add industry served
  void addIndustryServed(String industry) {
    final updatedList = List<String>.from(state.selectedIndustriesServed)
      ..add(industry);
    emit(state.copyWith(selectedIndustriesServed: updatedList));
  }

  // Remove industry served
  void removeIndustryServed(String industry) {
    final updatedList = List<String>.from(state.selectedIndustriesServed)
      ..remove(industry);
    emit(state.copyWith(selectedIndustriesServed: updatedList));
  }

  // add prefered languages
  void addPreferedLanguage(LanguageModel language) {
    final updatedList =
        List<LanguageModel>.from(state.selectedPreferedLanguages)
          ..add(language);
    emit(state.copyWith(selectedPreferedLanguages: updatedList));
  }

  // remove prefered languages
  void removePreferedLanguage(LanguageModel language) {
    final updatedList =
        List<LanguageModel>.from(state.selectedPreferedLanguages)
          ..remove(language);
    emit(state.copyWith(selectedPreferedLanguages: updatedList));
  }

  // add language pair
  void addLanguagePair(LanguageModel language) {
    final updatedList = List<LanguageModel>.from(state.selectedLanguagePair)
      ..add(language);
    emit(state.copyWith(selectedLanguagePair: updatedList));
  }

  // remove language pair
  void removeLanguagePair(LanguageModel language) {
    final updatedList = List<LanguageModel>.from(state.selectedLanguagePair)
      ..remove(language);
    emit(state.copyWith(selectedLanguagePair: updatedList));
  }
}

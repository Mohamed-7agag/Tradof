part of 'tables_cubit.dart';

class TablesState {
  // specializations & industries served
  final List<SpecializationModel> selectedSpecializations;
  final List<SpecializationModel> selectedIndustriesServed;
  // prefered language & language pair
  final List<LanguageModel> selectedPreferedLanguages;
  final List<LanguagePairModel> selectedLanguagePair;

  TablesState({
    this.selectedSpecializations = const <SpecializationModel>[],
    this.selectedIndustriesServed = const <SpecializationModel>[],
    this.selectedLanguagePair = const <LanguagePairModel>[],
    this.selectedPreferedLanguages = const <LanguageModel>[],
  });

  TablesState copyWith({
    List<SpecializationModel>? selectedSpecializations,
    List<SpecializationModel>? selectedIndustriesServed,
    List<LanguagePairModel>? selectedLanguagePair,
    List<LanguageModel>? selectedPreferedLanguages,
  }) {
    return TablesState(
      selectedSpecializations:
          selectedSpecializations ?? this.selectedSpecializations,
      selectedIndustriesServed:
          selectedIndustriesServed ?? this.selectedIndustriesServed,
      selectedLanguagePair: selectedLanguagePair ?? this.selectedLanguagePair,
      selectedPreferedLanguages:
          selectedPreferedLanguages ?? this.selectedPreferedLanguages,
    );
  }
}

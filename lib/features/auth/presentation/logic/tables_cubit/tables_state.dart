part of 'tables_cubit.dart';

class TablesState {
  // specializations & industries served
  final List<String> selectedSpecializations;
  final List<String> selectedIndustriesServed;
  // prefered language & language pair
  final List<LanguageModel> selectedPreferedLanguages;
  final List<LanguageModel> selectedLanguagePair;

  TablesState({
    this.selectedSpecializations = const [],
    this.selectedIndustriesServed = const [],
    this.selectedLanguagePair = const <LanguageModel>[],
    this.selectedPreferedLanguages = const <LanguageModel>[],
  });

  TablesState copyWith({
    List<String>? selectedSpecializations,
    List<String>? selectedIndustriesServed,
    List<LanguageModel>? selectedLanguagePair,
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

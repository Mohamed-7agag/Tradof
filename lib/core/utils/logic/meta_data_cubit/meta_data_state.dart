part of 'meta_data_cubit.dart';

enum MetaDataStatus {
  initial,
  loading,
  getCountries,
  getLanguages,
  getSpecializations,
  success, // ✅ Added success state
  error,
}

extension MetaDataStatusX on MetaDataStatus {
  bool get isInitial => this == MetaDataStatus.initial;
  bool get isLoading => this == MetaDataStatus.loading;
  bool get isGetCountries => this == MetaDataStatus.getCountries;
  bool get isGetLanguages => this == MetaDataStatus.getLanguages;
  bool get isGetSpecializations => this == MetaDataStatus.getSpecializations;
  bool get isSuccess => this == MetaDataStatus.success; // ✅ Added success check
  bool get isError => this == MetaDataStatus.error;
}

class MetaDataState extends Equatable {
  final MetaDataStatus status;
  final List<CountryModel> countries;
  final List<LanguageModel> languages;
  final List<SpecializationModel> specializations;
  final String errorMessage;

  const MetaDataState({
    this.status = MetaDataStatus.initial,
    this.countries = const [],
    this.languages = const [],
    this.specializations = const [],
    this.errorMessage = '',
  });

  /// ✅ **Check if all metadata is fetched**
  bool get isLoaded => 
      countries.isNotEmpty && languages.isNotEmpty && specializations.isNotEmpty;

  /// ✅ **Check if an error occurred for any metadata type**
  bool get hasError => errorMessage.isNotEmpty;

  MetaDataState copyWith({
    MetaDataStatus? status,
    List<CountryModel>? countries,
    List<LanguageModel>? languages,
    List<SpecializationModel>? specializations,
    String? errorMessage,
  }) {
    return MetaDataState(
      status: status ?? this.status,
      countries: countries ?? this.countries,
      languages: languages ?? this.languages,
      specializations: specializations ?? this.specializations,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        countries,
        languages,
        specializations,
        errorMessage,
      ];
}

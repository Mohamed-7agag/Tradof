part of 'meta_data_cubit.dart';

enum MetaDataStatus {
  initial,
  loading,
  getCountries,
  getLanguages,
  getSpecializations,
  error,
}

extension MetaDataStatusX on MetaDataStatus {
  bool get isInitial => this == MetaDataStatus.initial;
  bool get isLoading => this == MetaDataStatus.loading;
  bool get isGetCountries => this == MetaDataStatus.getCountries;
  bool get isGetLanguages => this == MetaDataStatus.getLanguages;
  bool get isGetSpecializations => this == MetaDataStatus.getSpecializations;
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

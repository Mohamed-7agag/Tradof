part of 'meta_data_cubit.dart';

enum MetaDataStatus {
  initial,
  loading,
  getCountries,
  getLanguages,
  getSpecializations,
  fetchAllMetaDataSuccess,
  error,
}

extension MetaDataStatusX on MetaDataStatus {
  bool get isInitial => this == MetaDataStatus.initial;
  bool get isLoading => this == MetaDataStatus.loading;
  bool get isGetCountries => this == MetaDataStatus.getCountries;
  bool get isGetLanguages => this == MetaDataStatus.getLanguages;
  bool get isGetSpecializations => this == MetaDataStatus.getSpecializations;
  bool get isFetchAllMetaDataSuccess => this == MetaDataStatus.fetchAllMetaDataSuccess;
  bool get isError => this == MetaDataStatus.error;
}

class MetaDataState extends Equatable {
  const MetaDataState({
    this.status = MetaDataStatus.initial,
    this.countries = const [],
    this.languages = const [],
    this.specializations = const [],
    this.errorMessage = '',
  });
  final MetaDataStatus status;
  final List<CountryModel> countries;
  final List<LanguageModel> languages;
  final List<SpecializationModel> specializations;
  final String errorMessage;

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


class MetaDataResult {
  MetaDataResult({
    required this.languages,
    required this.countries,
    required this.specializations,
  });
  final List<LanguageModel> languages;
  final List<CountryModel> countries;
  final List<SpecializationModel> specializations;
}
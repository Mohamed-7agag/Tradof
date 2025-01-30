part of 'registeration_cubit.dart';

enum RegisterationStatus {
  initial,
  loading,
  success,
  getCountries,
  getLanguages,
  getSpecializations,
  error,
}

enum UserRole { freelancer, company }

extension RegisterationStepX on RegisterationStatus {
  bool get isLoading => this == RegisterationStatus.loading;
  bool get isRegistered => this == RegisterationStatus.success;
  bool get isError => this == RegisterationStatus.error;
  bool get isGetCountries => this == RegisterationStatus.getCountries;
  bool get isGetLanguages => this == RegisterationStatus.getLanguages;
  bool get isGetSpecializations =>
      this == RegisterationStatus.getSpecializations;
}

class RegisterationState extends Equatable {
  final RegisterationStatus status;
  final UserRole userRole;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String password;
  final int country;
  final String locationCompany;
  final String jobTitle;

  final XFile? profileImage;
  final List<LanguageModel> languages;
  final List<CountryModel> countries;
  final List<SpecializationModel> specializations;

  final List<LanguagePairModel> selectedLanguagePair;
  final List<SpecializationModel> selectedSpecializations;
  final List<SpecializationModel> selectedIndustriesServed;
  final List<LanguageModel> selectedPreferedLanguages;

  final String errorMessage;
  const RegisterationState({
    this.status = RegisterationStatus.initial,
    this.userRole = UserRole.freelancer,
    this.errorMessage = '',
    this.email = '',
    this.phoneNumber = '',
    this.password = '',
    this.country = 0,
    this.firstName = '',
    this.lastName = '',
    this.jobTitle = '',
    this.locationCompany = '',
    this.profileImage,
    this.languages = const [],
    this.countries = const [],
    this.specializations = const [],
    this.selectedLanguagePair = const [],
    this.selectedSpecializations = const [],
    this.selectedIndustriesServed = const [],
    this.selectedPreferedLanguages = const [],
  });

  RegisterationState copyWith({
    RegisterationStatus? status,
    UserRole? userRole,
    String? errorMessage,
    String? email,
    String? phoneNumber,
    String? password,
    int? country,
    String? locationCompany,
    String? jobTitle,
    String? firstName,
    String? lastName,
    XFile? profileImage,
    List<LanguageModel>? languages,
    List<CountryModel>? countries,
    List<SpecializationModel>? specializations,
    List<LanguagePairModel>? selectedLanguagePair,
    List<SpecializationModel>? selectedSpecializations,
    List<SpecializationModel>? selectedIndustriesServed,
    List<LanguageModel>? selectedPreferedLanguages,
  }) {
    return RegisterationState(
      status: status ?? this.status,
      userRole: userRole ?? this.userRole,
      errorMessage: errorMessage ?? this.errorMessage,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      country: country ?? this.country,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      jobTitle: jobTitle ?? this.jobTitle,
      locationCompany: locationCompany ?? this.locationCompany,
      profileImage: profileImage ?? this.profileImage,
      languages: languages ?? this.languages,
      countries: countries ?? this.countries,
      specializations: specializations ?? this.specializations,
      selectedLanguagePair: selectedLanguagePair ?? this.selectedLanguagePair,
      selectedSpecializations:
          selectedSpecializations ?? this.selectedSpecializations,
      selectedIndustriesServed:
          selectedIndustriesServed ?? this.selectedIndustriesServed,
      selectedPreferedLanguages:
          selectedPreferedLanguages ?? this.selectedPreferedLanguages,
    );
  }

  @override
  List<Object> get props => [
        status,
        userRole,
        errorMessage,
        email,
        phoneNumber,
        password,
        country,
        firstName,
        lastName,
        profileImage ?? '',
        jobTitle,
        locationCompany,
        languages,
        countries,
        specializations,
        selectedLanguagePair,
        selectedSpecializations,
        selectedIndustriesServed,
        selectedPreferedLanguages
      ];
}

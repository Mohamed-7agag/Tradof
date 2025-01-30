import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tradof/features/auth/data/model/company_register_request_model.dart';
import 'package:tradof/features/auth/data/model/freelancer_register_request_model.dart';
import 'package:tradof/features/auth/data/model/language_model.dart';
import 'package:tradof/features/auth/data/model/language_pair_model.dart';
import 'package:tradof/features/auth/data/repo/registeration_repo.dart';

import '../../../data/model/country_model.dart';
import '../../../data/model/specialization_model.dart';

part 'registeration_state.dart';

class RegisterationCubit extends Cubit<RegisterationState> {
  RegisterationCubit(this._registerationRepo)
      : super(const RegisterationState());
  final RegisterationRepo _registerationRepo;

  void setUserRole(UserRole role) {
    emit(state.copyWith(userRole: role));
  }

  void setCommonRegisterationData(
    String firstName,
    String lastName,
    String email,
    String phoneNumber,
    String password,
  ) {
    emit(state.copyWith(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
    ));
  }

  void freelancerData(
    XFile profileImage,
    int countryId,
    List<SpecializationModel> specializations,
    List<LanguagePairModel> languagePairs,
  ) async {
    emit(state.copyWith(
      profileImage: profileImage,
      country: countryId,
      selectedLanguagePair: languagePairs,
      selectedSpecializations: specializations,
    ));
    await registerFreelancer();
  }

  void companyData(
    XFile profileImage,
    String jobTitle,
    int countryId,
    String locationCompany,
    List<LanguageModel> preferedLanguages,
    List<SpecializationModel> industriesServed,
  ) async{
    emit(state.copyWith(
      profileImage: profileImage,
      jobTitle: jobTitle,
      country: countryId,
      locationCompany: locationCompany,
      selectedPreferedLanguages: preferedLanguages,
      selectedIndustriesServed: industriesServed,
    ));
    await registerCompany();
  }

//! register for freelancer
  Future<void> registerFreelancer() async {
    emit(state.copyWith(status: RegisterationStatus.loading));
    final result = await _registerationRepo.freelancerRegister(
      _collectFreelancerRegisterationData(),
    );
    result.fold(
      (failure) => emit(state.copyWith(
        status: RegisterationStatus.error,
        errorMessage: failure.errMessage,
      )),
      (user) => emit(state.copyWith(
        status: RegisterationStatus.success,
      )),
    );
  }

//! register for company
  Future<void> registerCompany() async {
    emit(state.copyWith(status: RegisterationStatus.loading));
    final result = await _registerationRepo
        .companyRegister(_collectCompanyRegisterationData());
    result.fold(
      (failure) => emit(state.copyWith(
        status: RegisterationStatus.error,
        errorMessage: failure.errMessage,
      )),
      (user) => emit(state.copyWith(
        status: RegisterationStatus.success,
      )),
    );
  }

//! call them in the same time
  Future<void> fetchAllData() async {
    await Future.wait([
      getCountries(),
      getLanguages(),
      getSpecializations(),
    ]);
  }

  //! get Languages
  Future<void> getLanguages() async {
    emit(state.copyWith(status: RegisterationStatus.loading));
    final result = await _registerationRepo.getLanguages();
    result.fold(
      (failure) => emit(state.copyWith(
        status: RegisterationStatus.error,
        errorMessage: failure.errMessage,
      )),
      (languages) => emit(state.copyWith(
        status: RegisterationStatus.getLanguages,
        languages: languages,
      )),
    );
  }

  //! get Countries
  Future<void> getCountries() async {
    emit(state.copyWith(status: RegisterationStatus.loading));
    final result = await _registerationRepo.getCountries();
    result.fold(
      (failure) => emit(state.copyWith(
        status: RegisterationStatus.error,
        errorMessage: failure.errMessage,
      )),
      (countries) => emit(state.copyWith(
        status: RegisterationStatus.getCountries,
        countries: countries,
      )),
    );
  }

  //! get Specializations
  Future<void> getSpecializations() async {
    emit(state.copyWith(status: RegisterationStatus.loading));
    final result = await _registerationRepo.getSpecaialization();
    result.fold(
      (failure) => emit(state.copyWith(
        status: RegisterationStatus.error,
        errorMessage: failure.errMessage,
      )),
      (specializations) => emit(state.copyWith(
        status: RegisterationStatus.getSpecializations,
        specializations: specializations,
      )),
    );
  }

  FreelancerRegisterRequestModel _collectFreelancerRegisterationData() {
    List<int> specializationIds = state.selectedSpecializations
        .map((specialization) => specialization.id)
        .toList();

    List<LanguagePair> languagePairIds = state.selectedLanguagePair
        .map((languagePair) => LanguagePair(
              languageFromId: languagePair.fromLanguage.id,
              languageToId: languagePair.toLanguage.id,
            ))
        .toList();

    final FreelancerRegisterRequestModel freelancerRegisterRequestModel =
        FreelancerRegisterRequestModel(
      email: state.email,
      firstName: state.firstName,
      lastName: state.lastName,
      phoneNumber: state.phoneNumber,
      password: state.password,
    //  profileImageUrl: uploadImageToApi(state.profileImage ?? XFile('')), //
      countryId: state.country,
      languagePairs: languagePairIds,
      specializationIds: specializationIds,
    );

    return freelancerRegisterRequestModel;
  }

  CompanyRegisterRequestModel _collectCompanyRegisterationData() {
    List<int> specializationIds = state.selectedIndustriesServed
        .map((specialization) => specialization.id)
        .toList();

    List<int> preferredLanguageIds =
        state.selectedPreferedLanguages.map((language) => language.id).toList();

    final CompanyRegisterRequestModel companyRegisterRequestModel =
        CompanyRegisterRequestModel(
      email: state.email,
      firstName: state.firstName,
      lastName: state.lastName,
      phoneNumber: state.phoneNumber,
      password: state.password,
   //   profileImageUrl: uploadImageToApi(state.profileImage ?? XFile('')), //
      countryId: state.country,
      jobTitle: state.jobTitle,
      companyAddress: state.locationCompany,
      specializationIds: specializationIds,
      preferredLanguageIds: preferredLanguageIds,
    );

    return companyRegisterRequestModel;
  }
}

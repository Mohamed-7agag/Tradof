import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/utils/widgets/upload_image_to_cloudinary.dart';
import 'package:tradof/features/auth/data/model/company_register_request_model.dart';
import 'package:tradof/features/auth/data/model/freelancer_register_request_model.dart';
import 'package:tradof/features/auth/data/model/language_model.dart';
import 'package:tradof/features/auth/data/model/language_pair_model.dart';
import 'package:tradof/features/auth/data/repo/registeration_repo.dart';

import '../../../data/model/specialization_model.dart';

part 'registeration_state.dart';

class RegisterationCubit extends Cubit<RegisterationState> {
  RegisterationCubit(this._registerationRepo)
      : super(const RegisterationState());
  final RegisterationRepo _registerationRepo;

  void setUserRole(UserRole role) {
    emit(state.copyWith(userRole: role));
  }

  void setCountryAndImageProfile({int? countryId, File? imageProfile}) {
    emit(state.copyWith(countryId: countryId, imageProfile: imageProfile));
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

//! register for freelancer
  Future<void> registerFreelancer(
    List<SpecializationModel> specializations,
    List<LanguagePairModel> languagePairs,
  ) async {
    emit(state.copyWith(status: RegisterationStatus.loading));

    // get FreelancerRegisterRequestModel
    final FreelancerRegisterRequestModel freelancerRegisterRequestModel =
        await _collectFreelancerRegisterationData(
      specializations,
      languagePairs,
    );

    final result = await _registerationRepo.freelancerRegister(
      freelancerRegisterRequestModel,
    );
    result.fold(
      (failure) => emit(state.copyWith(
        status: RegisterationStatus.error,
        errorMessage: failure.errMessage,
      )),
      (successMessage) => emit(state.copyWith(
        status: RegisterationStatus.success,
        registerSuccessMessage: successMessage,
      )),
    );
  }

//! register for company
  Future<void> registerCompany(
    String jobTitle,
    String companyName,
    String locationCompany,
    List<LanguageModel> preferedLanguages,
    List<SpecializationModel> industriesServed,
  ) async {
    emit(state.copyWith(status: RegisterationStatus.loading));
    // get CompanyRegisterRequestModel
    final CompanyRegisterRequestModel companyRegisterRequestModel =
        await _collectCompanyRegisterationData(jobTitle, companyName,
            locationCompany, preferedLanguages, industriesServed);

    final result = await _registerationRepo.companyRegister(
      companyRegisterRequestModel,
    );
    result.fold(
      (failure) => emit(state.copyWith(
        status: RegisterationStatus.error,
        errorMessage: failure.errMessage,
      )),
      (message) => emit(state.copyWith(
        status: RegisterationStatus.success,
        registerSuccessMessage: message,
      )),
    );
  }

  Future<FreelancerRegisterRequestModel> _collectFreelancerRegisterationData(
    List<SpecializationModel> specializations,
    List<LanguagePairModel> languagePairs,
  ) async {
    List<int> specializationIds =
        specializations.map((specialization) => specialization.id).toList();

    List<LanguagePair> languagePairIds = languagePairs
        .map((languagePair) => LanguagePair(
              languageFromId: languagePair.fromLanguage.id,
              languageToId: languagePair.toLanguage.id,
            ))
        .toList();

    final imageUrl = await uploadImageToCloudinary(state.imageProfile!);

    final FreelancerRegisterRequestModel freelancerRegisterRequestModel =
        FreelancerRegisterRequestModel(
      email: state.email,
      firstName: state.firstName,
      lastName: state.lastName,
      phoneNumber: state.phoneNumber,
      password: state.password,
      profileImageUrl: imageUrl,
      countryId: state.countryId!,
      languagePairs: languagePairIds,
      specializationIds: specializationIds,
    );
    return freelancerRegisterRequestModel;
  }

  Future<CompanyRegisterRequestModel> _collectCompanyRegisterationData(
    String jobTitle,
    String companyName,
    String locationCompany,
    List<LanguageModel> preferedLanguages,
    List<SpecializationModel> industriesServed,
  ) async {
    List<int> specializationIds =
        industriesServed.map((specialization) => specialization.id).toList();

    List<int> preferredLanguageIds =
        preferedLanguages.map((language) => language.id).toList();

    final imageUrl = await uploadImageToCloudinary(state.imageProfile!);

    final CompanyRegisterRequestModel companyRegisterRequestModel =
        CompanyRegisterRequestModel(
      email: state.email,
      firstName: state.firstName,
      lastName: state.lastName,
      phoneNumber: state.phoneNumber,
      password: state.password,
      companyName: companyName,
      profileImageUrl: imageUrl,
      countryId: state.countryId!,
      jobTitle: jobTitle,
      companyAddress: locationCompany,
      specializationIds: specializationIds,
      preferredLanguageIds: preferredLanguageIds,
    );
    return companyRegisterRequestModel;
  }
}

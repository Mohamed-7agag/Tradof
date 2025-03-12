import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/exception.dart';
import '../../../../../core/utils/models/language_model.dart';
import '../../../../../core/utils/models/language_pair_model.dart';
import '../../../../../core/utils/widgets/upload_image_to_cloudinary.dart';
import '../../../data/model/company_register_request_model.dart';
import '../../../data/model/freelancer_register_request_model.dart';
import '../../../../../core/utils/models/specialization_model.dart';
import '../../../data/repo/auth_repo.dart';

part 'registeration_state.dart';

class RegisterationCubit extends Cubit<RegisterationState> {
  RegisterationCubit(this._authRepo) : super(const RegisterationState());
  final AuthRepo _authRepo;

  void setRegisterationData({
    UserRole? userRole,
    int? countryId,
    File? imageProfile,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? password,
  }) {
    emit(state.copyWith(
      userRole: userRole,
      countryId: countryId,
      imageProfile: imageProfile,
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
    emit(state.copyWith(
      status: RegisterationStatus.registerationLoading,
    ));

    try {
      final freelancerRegisterRequestModel =
          await _fetchFreelancerRegistrationData(
        specializations,
        languagePairs,
      );

      final result = await _authRepo.freelancerRegister(
        freelancerRegisterRequestModel,
      );
      emit(state.copyWith(
        status: RegisterationStatus.registerationSuccess,
        registerSuccessMessage: result,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: RegisterationStatus.registerationFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

//! register for company
  Future<void> registerCompany(
    String jobTitle,
    String companyName,
    String locationCompany,
    List<LanguageModel> preferedLanguages,
    List<SpecializationModel> industriesServed,
  ) async {
    emit(state.copyWith(
      status: RegisterationStatus.registerationLoading,
    ));

    try {
      final companyRegisterRequestModel = await _fetchCompanyRegistrationData(
        jobTitle,
        companyName,
        locationCompany,
        preferedLanguages,
        industriesServed,
      );

      final result = await _authRepo.companyRegister(
        companyRegisterRequestModel,
      );
      emit(state.copyWith(
        status: RegisterationStatus.registerationSuccess,
        registerSuccessMessage: result,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: RegisterationStatus.registerationFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<FreelancerRegisterRequestModel> _fetchFreelancerRegistrationData(
    List<SpecializationModel> specializations,
    List<LanguagePairModel> languagePairs,
  ) async {
    final specializationIds =
        specializations.map((specialization) => specialization.id).toList();

    final List<LanguagePair> languagePairIds = languagePairs
        .map((languagePair) => LanguagePair(
              languageFromId: languagePair.fromLanguage.id,
              languageToId: languagePair.toLanguage.id,
            ))
        .toList();

    final imageUrl = await uploadImageToCloudinary(state.imageProfile);

    return FreelancerRegisterRequestModel(
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
  }

  Future<CompanyRegisterRequestModel> _fetchCompanyRegistrationData(
    String jobTitle,
    String companyName,
    String locationCompany,
    List<LanguageModel> preferedLanguages,
    List<SpecializationModel> industriesServed,
  ) async {
    final specializationIds =
        industriesServed.map((specialization) => specialization.id).toList();

    final preferredLanguageIds =
        preferedLanguages.map((language) => language.id).toList();

    final imageUrl = await uploadImageToCloudinary(state.imageProfile);

    return CompanyRegisterRequestModel(
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
  }
}

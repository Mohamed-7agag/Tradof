import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileImageAndCountryState {
  final int? countryId;
  final File? imagePicked;
  ProfileImageAndCountryState({
    this.countryId,
    this.imagePicked,
  });
  ProfileImageAndCountryState copyWith({
    int? countryId,
    File? imagePicked,
  }) {
    return ProfileImageAndCountryState(
      countryId: countryId ?? this.countryId,
      imagePicked: imagePicked ?? this.imagePicked,
    );
  }
}

// Cubit
class ProfileImageAndCountryCubit extends Cubit<ProfileImageAndCountryState> {
  ProfileImageAndCountryCubit() : super(ProfileImageAndCountryState());

  void onCountrySelected(int? countryId) {
    emit(state.copyWith(countryId: countryId));
  }

  void onImagePicked(File? image) {
    log('picked image: $image');
    emit(state.copyWith(imagePicked: image));
  }
}

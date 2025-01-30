import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImageAndCountryState {
  final int? countryId;
  final XFile? imagePicked;
  ProfileImageAndCountryState({
    this.countryId,
    this.imagePicked,
  });
  ProfileImageAndCountryState copyWith({
    int? countryId,
    XFile? imagePicked,
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

  void onImagePicked(XFile? image) {
    emit(state.copyWith(imagePicked: image));
  }
}

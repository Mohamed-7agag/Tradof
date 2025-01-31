import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/utils/repo/meta_data_repo.dart';

import '../../../../features/auth/data/model/country_model.dart';
import '../../../../features/auth/data/model/language_model.dart';
import '../../../../features/auth/data/model/specialization_model.dart';

part 'meta_data_state.dart';

class MetaDataCubit extends Cubit<MetaDataState> {
  MetaDataCubit(this._metaDataRepo) : super(const MetaDataState());
  final MetaDataRepo _metaDataRepo;

  //! call them in the same time
  Future<void> fetchAllMetaData() async {
    await Future.wait([
      getCountries(),
      getLanguages(),
      getSpecializations(),
    ]);
  }

  //! get Languages
  Future<void> getLanguages() async {
    emit(state.copyWith(status: MetaDataStatus.loading));
    final result = await _metaDataRepo.getLanguages();
    result.fold(
      (failure) => emit(state.copyWith(
        status: MetaDataStatus.error,
        errorMessage: failure.errMessage,
      )),
      (languages) => emit(state.copyWith(
        status: MetaDataStatus.getLanguages,
        languages: languages,
      )),
    );
  }

  //! get Countries
  Future<void> getCountries() async {
    emit(state.copyWith(status: MetaDataStatus.loading));
    final result = await _metaDataRepo.getCountries();
    result.fold(
      (failure) => emit(state.copyWith(
        status: MetaDataStatus.error,
        errorMessage: failure.errMessage,
      )),
      (countries) => emit(state.copyWith(
        status: MetaDataStatus.getCountries,
        countries: countries,
      )),
    );
  }

  //! get Specializations
  Future<void> getSpecializations() async {
    emit(state.copyWith(status: MetaDataStatus.loading));
    final result = await _metaDataRepo.getSpecaialization();
    result.fold(
      (failure) => emit(state.copyWith(
        status: MetaDataStatus.error,
        errorMessage: failure.errMessage,
      )),
      (specializations) => emit(state.copyWith(
        status: MetaDataStatus.getSpecializations,
        specializations: specializations,
      )),
    );
  }
}

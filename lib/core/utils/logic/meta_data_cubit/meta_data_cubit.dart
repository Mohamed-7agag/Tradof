import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../features/auth/data/model/specialization_model.dart';
import '../../../errors/exception.dart';
import '../../models/country_model.dart';
import '../../models/language_model.dart';
import '../../repo/meta_data_repo.dart';

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
    if (state.languages.isNotEmpty) return;
    emit(state.copyWith(status: MetaDataStatus.loading));
    try {
      final languages = await _metaDataRepo.getLanguages();
      if (isClosed) return;
      emit(state.copyWith(
        status: MetaDataStatus.getLanguages,
        languages: languages,
      ));
    } catch (e) {
      if (isClosed) return;
      emit(state.copyWith(
        status: MetaDataStatus.error,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  //! get Countries
  Future<void> getCountries() async {
    if (state.countries.isNotEmpty) return;
    emit(state.copyWith(status: MetaDataStatus.loading));

    try {
      final countries = await _metaDataRepo.getCountries();
      if (isClosed) return;
      emit(state.copyWith(
        status: MetaDataStatus.getCountries,
        countries: countries,
      ));
    } catch (e) {
      if (isClosed) return;
      emit(state.copyWith(
        status: MetaDataStatus.error,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  //! get Specializations
  Future<void> getSpecializations() async {
    if (state.specializations.isNotEmpty) return;
    emit(state.copyWith(status: MetaDataStatus.loading));

    try {
      final specializations = await _metaDataRepo.getSpecaialization();
      if (isClosed) return;
      emit(state.copyWith(
        status: MetaDataStatus.getSpecializations,
        specializations: specializations,
      ));
    } catch (e) {
      if (isClosed) return;
      emit(state.copyWith(
        status: MetaDataStatus.error,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
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

  Future<void> fetchAllMetaData() async {
    if (state.status.isFetchAllMetaDataSuccess) return;

    emit(state.copyWith(status: MetaDataStatus.loading));
    try {
      final RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;

      final result = await compute(_fetchMetaDataInIsolate, {
        'repo': _metaDataRepo,
        'token': rootIsolateToken,
      });

      if (isClosed) return;
      emit(state.copyWith(
        status: MetaDataStatus.fetchAllMetaDataSuccess,
        languages: result.languages,
        countries: result.countries,
        specializations: result.specializations,
      ));
    } catch (e) {
      if (isClosed) return;
      emit(state.copyWith(
        status: MetaDataStatus.error,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

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

  //???????????? will using in future ???????????
  void clearMetaData() {
    emit(const MetaDataState());
  }
}

/// Runs fetching in an isolate to improve performance
Future<MetaDataResult> _fetchMetaDataInIsolate(
    Map<String, dynamic> params) async {
  BackgroundIsolateBinaryMessenger.ensureInitialized(
    params['token'] as RootIsolateToken,
  );
  final MetaDataRepo repo = params['repo'] as MetaDataRepo;

  try {
    final results = await Future.wait([
      repo.getLanguages(),
      repo.getCountries(),
      repo.getSpecaialization(),
    ]);

    return MetaDataResult(
      languages: results[0] as List<LanguageModel>,
      countries: results[1] as List<CountryModel>,
      specializations: results[2] as List<SpecializationModel>,
    );
  } catch (e) {
    throw Exception("Failed to fetch metadata: ${e.toString()}");
  }
}

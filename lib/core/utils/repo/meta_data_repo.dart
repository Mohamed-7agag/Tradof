import 'package:dartz/dartz.dart';

import '../../../features/auth/data/model/country_model.dart';
import '../../../features/auth/data/model/language_model.dart';
import '../../../features/auth/data/model/specialization_model.dart';
import '../../errors/failure.dart';

abstract class MetaDataRepo {
  Future<Either<Failure, List<CountryModel>>> getCountries();
  Future<Either<Failure, List<LanguageModel>>> getLanguages();
  Future<Either<Failure, List<SpecializationModel>>> getSpecaialization();
}

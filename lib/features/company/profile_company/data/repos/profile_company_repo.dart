import 'package:dartz/dartz.dart';
import 'package:tradof/core/errors/failure.dart';
import 'package:tradof/features/auth/data/model/language_model.dart';
import 'package:tradof/features/auth/data/model/specialization_model.dart';

abstract class ProfileCompanyRepo {
  
  
  Future<Either<Failure, List<LanguageModel>>> getLanguages();
  Future<Either<Failure, List<SpecializationModel>>> getSpecaialization();

}

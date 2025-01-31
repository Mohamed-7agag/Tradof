import 'package:dartz/dartz.dart';
import 'package:tradof/core/errors/failure.dart';
import 'package:tradof/features/auth/data/model/language_model.dart';
import 'package:tradof/features/auth/data/model/specialization_model.dart';


abstract class ProfileCompanyRepo {
  Future<Either<Failure, List<LanguageModel>>> getLanguages();
  Future<Either<Failure, List<SpecializationModel>>> getSpecaialization();
  Future<Either<Failure, String>> getCompanyProfrile({required String id});
  Future<Either<Failure,LanguageModel>>addPreferedLanguages({required LanguageModel languageModel});
  Future<Either<Failure,SpecializationModel>>addIndustriesService({required SpecializationModel specializationModel});
  Future<Either<Failure,String>>deletePreferedLanguages({required LanguageModel languageModel});
  Future<Either<Failure,String>>deleteIndustriesService({required SpecializationModel specializationModel});

}

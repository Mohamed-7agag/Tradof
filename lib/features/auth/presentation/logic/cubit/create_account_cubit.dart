import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit() : super(CreateAccountInitial());

  List<String> specializations = [];
  List<String> languagePairs = [];

  void addSpecialization(String specialization) {
    if (!specializations.contains(specialization)) {
      specializations.add(specialization);
    }
  
  }

  void removeSpecialization(String specialization) {
    specializations.remove(specialization);
  }

  void addLanguagePair(String languagePair) {
    if (!languagePairs.contains(languagePair)) {
      languagePairs.add(languagePair);
   
    }
  }

  void removeLanguagePair(String languagePair) {
    languagePairs.remove(languagePair);
   
  }
}

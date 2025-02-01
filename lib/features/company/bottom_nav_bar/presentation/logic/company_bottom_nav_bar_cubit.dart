import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyBottomNavBarCubit extends Cubit<int> {
  CompanyBottomNavBarCubit() : super(0);

  void updateIndex(int index) => emit(index);
}
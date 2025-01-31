import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';

class FileCubit extends Cubit<List<PlatformFile>> {
  FileCubit() : super([]);

  void addFiles(List<PlatformFile> files) {
    emit([...state, ...files]);
  }

  void removeFile(int index) {
    final updatedFiles = List<PlatformFile>.from(state);
    updatedFiles.removeAt(index);
    emit(updatedFiles);
  }

  List<PlatformFile> getFiles() => state;
}
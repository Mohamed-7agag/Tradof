import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:open_file/open_file.dart';

import '../../../../core/helpers/custom_url_launcher.dart';
import '../../../../core/theming/app_colors.dart';
import '../../data/models/file_model.dart';
import '../logic/file_cubit.dart';

class AttachmentFilesSection extends StatelessWidget {
  const AttachmentFilesSection({
    super.key,
    this.filesList,
    this.onDeleteFile,
  });

  final List<FileModel>? filesList;
  final Function(int fileId)? onDeleteFile;

  Future<void> _pickFiles(BuildContext context) async {
    final FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null && context.mounted) {
      context.read<FileCubit>().addFiles(result.files);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        BlocBuilder<FileCubit, List<PlatformFile>>(
          builder: (context, files) {
            return Container(
              width: 1.sw,
              height: filesList!.isEmpty && files.isEmpty ? 80 : null,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                border: Border.all(color: AppColors.grey),
              ),
              child: Column(
                children: [
                  if (filesList!.isNotEmpty)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: filesList!.asMap().entries.map((entry) {
                        final index = entry.key;
                        final file = entry.value;
                        return ListTile(
                          onTap: () =>
                              customUrlLauncher(context, file.filePath),
                          contentPadding: EdgeInsets.only(
                            left: 10.w,
                            bottom: index == filesList!.length - 1
                                ? (files.isEmpty ? 20 : 0)
                                : 0,
                          ),
                          title: Text(file.fileName),
                          leading: const HugeIcon(
                              icon: HugeIcons.strokeRoundedFile02,
                              color: AppColors.black),
                          trailing: IconButton(
                              icon: const Icon(Icons.cancel, color: Colors.red),
                              onPressed: () {
                                onDeleteFile?.call(file.id);
                              }),
                        );
                      }).toList(),
                    ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: files.asMap().entries.map((entry) {
                      final index = entry.key;
                      final file = entry.value;
                      return ListTile(
                        onTap: () async {
                          try {
                            await OpenFile.open(file.path);
                          } catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        'Could not open file: ${e.toString()}')),
                              );
                            }
                          }
                        },
                        contentPadding: EdgeInsets.only(
                          left: 10.w,
                          bottom: index == files.length - 1 ? 20 : 0,
                        ),
                        title: Text(file.name),
                        leading: const HugeIcon(
                            icon: HugeIcons.strokeRoundedFile02,
                            color: AppColors.black),
                        trailing: IconButton(
                          icon: const Icon(Icons.cancel, color: Colors.red),
                          onPressed: () =>
                              context.read<FileCubit>().removeFile(index),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            );
          },
        ),
        Positioned(
          bottom: -20,
          right: 15,
          child: IconButton(
            onPressed: () => _pickFiles(context),
            icon: const HugeIcon(
              icon: HugeIcons.strokeRoundedAdd01,
              color: AppColors.white,
              size: 26,
            ),
            style: IconButton.styleFrom(
                backgroundColor: AppColors.lightOrange,
                foregroundColor: AppColors.white,
                padding: const EdgeInsets.all(12)),
          ),
        )
      ],
    );
  }
}

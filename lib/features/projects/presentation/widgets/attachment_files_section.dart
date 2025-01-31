import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/features/projects/presentation/logic/file_cubit.dart';

import '../../../../core/theming/app_colors.dart';

class AttachmentFilesSection extends StatelessWidget {
  const AttachmentFilesSection({super.key});

  Future<void> _pickFiles(BuildContext context) async {
    FilePickerResult? result =
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
              height: files.isEmpty ? 80 : null,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.grey),
              ),
              child: ListView.builder(
                itemCount: files.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.only(
                      left: 10.w,
                      bottom: index == files.length - 1 ? 20 : 0,
                    ),
                    title: Text(files[index].name),
                    leading: Icon(Icons.attach_file),
                    trailing: IconButton(
                      icon: Icon(Icons.cancel, color: Colors.red),
                      onPressed: () =>
                          context.read<FileCubit>().removeFile(index),
                    ),
                  );
                },
              ),
            );
          },
        ),
        Positioned(
          bottom: -25,
          right: 15,
          child: IconButton(
            onPressed: () => _pickFiles(context),
            icon: Icon(Icons.add, size: 28),
            style: IconButton.styleFrom(
                backgroundColor: AppColors.lightOrange,
                foregroundColor: AppColors.white,
                padding: EdgeInsets.all(10)),
          ),
        )
      ],
    );
  }
}

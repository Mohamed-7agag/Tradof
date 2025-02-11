import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/helpers/custom_url_launcher.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/core/utils/widgets/custom_loading_dialog.dart';
import 'package:tradof/core/utils/widgets/custom_toastification.dart';

import '../logic/freelancer_profile_cubit/freelancer_profile_cubit.dart';

class FreelancerCvSection extends StatelessWidget {
  const FreelancerCvSection({super.key, this.cvUrl});
  final String? cvUrl;
  Future<void> _pickCV(BuildContext context) async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result != null && context.mounted) {
      context.read<FreelancerProfileCubit>().uploadCv(result.files.first);
    }
  }

  @override
  Widget build(BuildContext context) {
    log('builddddddddd');
    return BlocListener<FreelancerProfileCubit, FreelancerProfileState>(
      listenWhen: (previous, current) =>
          current.status.isUploadCvSuccess ||
          current.status.isUploadCvLoading ||
          current.status.isUploadCvFailure,
      listener: (context, state) {
        if (state.status.isUploadCvSuccess) {
          context.pop();
          context.read<FreelancerProfileCubit>().getFreelancerProfile();
          successToast(context, 'Success', state.message);
        } else if (state.status.isUploadCvFailure) {
          context.pop();
          errorToast(context, 'Error', state.errMessage);
        } else if (state.status.isUploadCvLoading) {
          loadingDialog(context);
        }
      },
      child: InkWell(
        onTap: () {
          if (cvUrl == null) {
            _pickCV(context);
          } else {
            customUrlLauncher(context, cvUrl!);
          }
        },
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 12, vertical: cvUrl == null ? 18 : 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.cardColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cvUrl == null ? 'Upload CV' : 'Open CV',
                style: AppStyle.poppinsMedium14,
              ),
              cvUrl == null
                  ? Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(Icons.file_upload_outlined),
                    )
                  : Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              _pickCV(context);
                            },
                            icon: Icon(
                              Icons.change_circle_rounded,
                              size: 32,
                              color: AppColors.lightOrange,
                            )),
                        horizontalSpace(10),
                        Icon(Icons.open_in_new_rounded),
                        horizontalSpace(8),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/helpers/custom_url_launcher.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_style.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/widgets/custom_linear_progress_indicator.dart';
import '../../../../../core/utils/widgets/custom_toastification.dart';
import '../logic/freelancer_profile_cubit/freelancer_profile_cubit.dart';

class FreelancerCvSection extends StatelessWidget {
  const FreelancerCvSection({
    required this.freelancerId,
    super.key,
    this.cvUrl,
  });

  final String? cvUrl;
  final String freelancerId;

  Future<void> _pickCV(BuildContext context) async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && context.mounted) {
      context.read<FreelancerProfileCubit>().uploadCv(result.files.first);
    }
  }

  void _handleCvAction(BuildContext context) {
    if (cvUrl == null) {
      _pickCV(context);
    } else {
      customUrlLauncher(context, cvUrl!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FreelancerProfileCubit, FreelancerProfileState>(
      listenWhen: (previous, current) => _listenAndBuildWhen(current),
      buildWhen: (previous, current) => _listenAndBuildWhen(current),
      listener: (context, state) {
        if (state.status.isUploadCvSuccess) {
          context.read<FreelancerProfileCubit>().getFreelancerProfile();
          successToast(context, 'Success', state.message);
        } else if (state.status.isUploadCvFailure) {
          errorToast(context, 'Error', state.errMessage);
        }
      },
      builder: (context, state) {
        if (state.status.isUploadCvLoading) {
          return CustomLinearProgressIndicator(
            progress: state.progress,
            endText: 'upload CV',
          );
        }

        return InkWell(
          onTap: () => _handleCvAction(context),
          borderRadius: const BorderRadius.all(Radius.circular(14)),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: cvUrl == null ? 18 : 8,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: AppColors.cardColor,
            ),
            child: cvUrl == null
                ? _buildUploadCvSection()
                : _buildOpenCvSection(context),
          ),
        );
      },
    );
  }

  Widget _buildUploadCvSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Upload CV',
          style: AppStyle.poppinsMedium14,
        ),
        const Padding(
          padding: EdgeInsets.only(right: 6),
          child: HugeIcon(
            icon: HugeIcons.strokeRoundedUpload01,
            color: AppColors.lightOrange,
            size: 27,
          ),
        ),
      ],
    );
  }

  Widget _buildOpenCvSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Open CV',
          style: AppStyle.poppinsMedium14,
        ),
        Row(
          children: [
            freelancerId == AppConstants.kUserId
                ? IconButton(
                    onPressed: () => _pickCV(context),
                    icon: const HugeIcon(
                      icon: HugeIcons.strokeRoundedExchange01,
                      color: AppColors.lightOrange,
                      size: 27,
                    ),
                  )
                : verticalSpace(40),
            horizontalSpace(10),
            const HugeIcon(
              icon: HugeIcons.strokeRoundedSquareArrowUpRight,
              color: AppColors.black,
              size: 27,
            ),
            horizontalSpace(6),
          ],
        ),
      ],
    );
  }

  bool _listenAndBuildWhen(FreelancerProfileState current) {
    return current.status.isUploadCvSuccess ||
        current.status.isUploadCvLoading ||
        current.status.isUploadCvFailure;
  }
}

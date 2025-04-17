import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../../../core/utils/widgets/custom_loading_dialog.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../logic/cubit/offer_cubit.dart';
import '../logic/cubit/offer_state_extension.dart';

class OfferHeaderSection extends StatelessWidget {
  const OfferHeaderSection({
    required this.offerId,
    super.key,
  });
  final int offerId;

  @override
  Widget build(BuildContext context) {
    return BlocListener<OfferCubit, OfferState>(
      listenWhen: (previous, current) => _listenAndBuildWhen(current),
      listener: (context, state) {
        if (state.status.isDeleteOfferSuccess ||
            state.status.isCancelOfferSuccess) {
          context.pop();
          successToast(context, 'Success', state.message);
          context.pop(result: true);
        } else if (state.status.isDeleteOfferFailure ||
            state.status.isCancelOfferFailure) {
          context.pop();
          errorToast(context, 'Error', state.message);
        } else if (state.status.isDeleteOfferLoading ||
            state.status.isCancelOfferLoading) {
          loadingDialog(context);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: AppColors.cardColor,
        ),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  _showDialog(context, offerId, 'Are you sure you want to delete this offer ?', true);
                },
                child: Column(
                  children: [
                    Text(
                      'Delete',
                      style: AppStyle.robotoCondensedMedium15
                          .copyWith(color: Colors.red),
                    ),
                    verticalSpace(6),
                    const HugeIcon(
                      icon: HugeIcons.strokeRoundedDelete02,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
              child: VerticalDivider(
                color: AppColors.cardDarkColor,
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  _showDialog(context, offerId, 'Are you sure you want to cancel this offer ?', false);
                },
                child: Column(
                  children: [
                    Text(
                      'Cancel',
                      style: AppStyle.robotoCondensedMedium15
                          .copyWith(color: AppColors.primary),
                    ),
                    verticalSpace(6),
                    const HugeIcon(
                      icon: HugeIcons.strokeRoundedCancel01,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool _listenAndBuildWhen(OfferState state) {
    return state.status.isDeleteOfferSuccess ||
        state.status.isDeleteOfferFailure ||
        state.status.isDeleteOfferLoading ||
        state.status.isCancelOfferSuccess ||
        state.status.isCancelOfferFailure ||
        state.status.isCancelOfferLoading;
  }

  void _showDialog(BuildContext context, int offerId,String text,bool isDelete) {
    AwesomeDialog(
        context: context,
        animType: AnimType.rightSlide,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        dialogType: DialogType.question,
        body: Text(
         text,
          textAlign: TextAlign.center,
          style: AppStyle.robotoRegular14.copyWith(height: 1.8),
        ),
        btnCancelOnPress: () {},
        btnOkOnPress: () {
          if (isDelete) {
            context.read<OfferCubit>().deleteOffer(offerId);
          } else {
            context.read<OfferCubit>().cancelOffer(offerId);
          }
        }).show();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../../../projects/presentation/logic/file_cubit.dart';
import '../logic/cubit/offer_cubit.dart';
import '../logic/cubit/offer_state_extension.dart';

class AddOfferButton extends StatelessWidget {
  const AddOfferButton({
    required this.offerDetailsController,
    required this.daysController,
    required this.projectId,
    super.key,
  });
  final TextEditingController offerDetailsController;
  final TextEditingController daysController;
  final int projectId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OfferCubit, OfferState>(
      listener: (context, state) {
        if (state.status.isAddOfferSuccess) {
          successToast(context, 'Success', state.message);
          context.pop();
        } else if (state.status.isAddOfferFailure) {
          errorToast(context, 'Error', state.errorMessage);
        }
      },
      builder: (context, state) {
        return state.status.isAddOfferLoading
            ? const CustomLoadingWidget()
            : CustomButton(
                text: 'Add Offer',
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  _addOfferValidation(context, state);
                },
              );
      },
    );
  }

  void _addOfferValidation(BuildContext context, OfferState state) {
    if (offerDetailsController.text.trim().isNullOrEmpty()) {
      errorToast(context, 'Error', 'Please Enter Offer Details');
    } else if (daysController.text.trim().isNullOrEmpty() ||
        daysController.text == '0') {
      errorToast(context, 'Error', 'Please Enter valid Delivery Time');
    } else if (state.offerPrice == null || state.offerPrice == 0) {
      errorToast(context, 'Error', 'Please Enter Offer Price');
    } else {
      context.read<OfferCubit>().addOffer(
            projectId,
            offerDetailsController.text.trim(),
            int.parse(daysController.text.trim()),
            files: context.read<FileCubit>().state,
          );
    }
  }
}

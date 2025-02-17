import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/utils/widgets/custom_button.dart';
import 'package:tradof/core/utils/widgets/custom_toastification.dart';
import 'package:tradof/features/offers/presentation/logic/cubit/offer_cubit.dart';

import '../../../../core/utils/widgets/custom_loading_widget.dart';

class CreateOfferButton extends StatelessWidget {
  const CreateOfferButton(
      {required this.offerDetailsController, required this.daysController, super.key});
  final TextEditingController offerDetailsController;
  final TextEditingController daysController;
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
    } else if (daysController.text.trim().isNullOrEmpty()) {
      errorToast(context, 'Error', 'Please Enter Delivery Time');
    } else if (state.offerPrice == null || state.offerPrice == 0) {
      errorToast(context, 'Error', 'Please Enter Offer Price');
    } else {
      context.read<OfferCubit>().addOffer(
            context.read(),
            offerDetailsController.text.trim(),
            int.parse(daysController.text.trim()),
          );
    }
  }
}

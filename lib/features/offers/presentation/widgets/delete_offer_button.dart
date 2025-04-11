import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../logic/cubit/offer_cubit.dart';
import '../logic/cubit/offer_state_extension.dart';

class DeleteOfferButton extends StatelessWidget {
  const DeleteOfferButton({
    required this.offerId,
    super.key,
  });
  final int offerId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OfferCubit, OfferState>(
      listener: (context, state) {
        if (state.status.isCancelOfferSuccess) {
          successToast(context, 'Success', state.message);
          context.pop();
        } else if (state.status.isCancelOfferFailure) {
          errorToast(context, 'Error', state.errorMessage);
        }
      },
      builder: (context, state) {
        return state.status.isCancelOfferLoading
            ? const CustomLoadingWidget()
            : CustomButton(
                text: 'Cancel',
                color: Colors.red,
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  context.read<OfferCubit>().cancelOffer(offerId);
                },
              );
      },
    );
  }
}

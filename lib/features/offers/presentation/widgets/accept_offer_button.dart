import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../logic/cubit/offer_cubit.dart';
import '../logic/cubit/offer_state_extension.dart';

class AcceptOfferButton extends StatelessWidget {
  const AcceptOfferButton({
    required this.projectId,
    required this.offerId,
    super.key,
  });
  final int projectId;
  final int offerId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OfferCubit, OfferState>(
      listenWhen: (previous, current) => _buildAndListenWhen(current),
      buildWhen: (previous, current) => _buildAndListenWhen(current),
      listener: (context, state) {
        if (state.status.isAcceptOfferSuccess) {
          context.pop();
          successToast(context, 'Success', state.message);
        } else if (state.status.isAcceptOfferFailure) {
          errorToast(context, 'Error', state.errorMessage);
        }
      },
      builder: (context, state) {
        return state.status.isAcceptOfferLoading
            ? const CustomLoadingWidget()
            : CustomButton(
                text: 'Accept',
                onPressed: () {
                  context.read<OfferCubit>().acceptOffer(
                        projectId,
                        offerId,
                      );
                },
                color: Colors.green,
              );
      },
    );
  }

  bool _buildAndListenWhen(OfferState current) {
    return current.status.isAcceptOfferFailure ||
        current.status.isAcceptOfferLoading ||
        current.status.isAcceptOfferSuccess;
  }
}

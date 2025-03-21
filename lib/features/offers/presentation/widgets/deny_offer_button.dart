import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../logic/cubit/offer_cubit.dart';

class DenyOfferButton extends StatelessWidget {
  const DenyOfferButton({
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
        if (state.status.isDenyOfferSuccess) {
          context.pop();
          successToast(context, 'Success', state.message);
        } else if (state.status.isDenyOfferFailure) {
          errorToast(context, 'Error', state.errorMessage);
        }
      },
      builder: (context, state) {
        return state.status.isDenyOfferLoading
            ? const CustomLoadingWidget()
            : CustomButton(
                text: 'Deny',
                onPressed: () {
                  context.read<OfferCubit>().denyOffer(
                        projectId,
                        offerId,
                      );
                },
                color: Colors.red,
              );
      },
    );
  }

  bool _buildAndListenWhen(OfferState current) {
    return current.status.isDenyOfferFailure ||
        current.status.isDenyOfferLoading ||
        current.status.isDenyOfferSuccess;
  }
}

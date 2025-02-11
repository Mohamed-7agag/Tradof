import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/utils/widgets/custom_button.dart';
import 'package:tradof/core/utils/widgets/custom_failure_widget.dart';
import 'package:tradof/core/utils/widgets/custom_loading_widget.dart';
import 'package:tradof/features/offers/presentation/logic/cubit/offer_cubit.dart';

class CreateOfferButton extends StatelessWidget {
  const CreateOfferButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OfferCubit, OfferState>(
      builder: (context, state) {
        if (state.status == OfferStatus.createOfferSucess) {
          return CustomButton(
              text: 'Create',
              onPressed: () {
                context.read<OfferCubit>().createOffer(1); //! project id
              });
        } else if (state.status == OfferStatus.createOfferFailure) {
          return CustomFailureWidget(text: state.errorMessage);
        }else{
          return const CustomLoadingWidget();
        }
      },
    );
  }
}

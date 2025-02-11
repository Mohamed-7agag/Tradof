import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tradof/features/offers/data/model/create_offer_request_model.dart';
import 'package:tradof/features/offers/data/repos/offer_repo.dart';

part 'offer_state.dart';

class OfferCubit extends Cubit<OfferState> {
  OfferCubit(this._offerRepo) : super(const OfferState());

  final OfferRepo _offerRepo;

  TextEditingController offerDetailsController = TextEditingController();
  DateTime selectedDate = DateTime.now().add(const Duration(days: 2));
  double selectedBudget = 0.0;

  Future<void> createOffer(
    int projectId,
  ) async {
    emit(state.copyWith(status: OfferStatus.createOfferLoading));
    final result = await _offerRepo.createOffer(
      CreateOfferRequestModel(
       offerPrice: selectedBudget,
       projectDeliveryTime: selectedDate,
       proposalDescription: offerDetailsController.text,
       projectId: projectId
      ),
    );
    result.fold(
      (failure) {
        emit(state.copyWith(
          status: OfferStatus.createOfferFailure,
          errorMessage: failure.errMessage,
        ));
      },
      (response) {
        emit(state.copyWith(status: OfferStatus.createOfferSucess));
      },
    );
  }
}

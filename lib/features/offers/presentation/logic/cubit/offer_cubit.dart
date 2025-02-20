import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/exception.dart';
import '../../../data/model/add_offer_request_model.dart';
import '../../../data/repos/offer_repo.dart';

part 'offer_state.dart';

class OfferCubit extends Cubit<OfferState> {
  OfferCubit(this._offerRepo) : super(const OfferState());

  final OfferRepo _offerRepo;

  Future<void> addOffer(int projectId, String offerDetails, int days) async {
    emit(state.copyWith(status: OfferStatus.addOfferLoading));

    try {
      final AddOfferRequestModel offerModel = AddOfferRequestModel(
        offerPrice: state.offerPrice!,
        days: days,
        proposalDescription: offerDetails,
        projectId: projectId,
      );

      final result = await _offerRepo.addOffer(offerModel);
      emit(state.copyWith(
        status: OfferStatus.addOfferSucess,
        message: result,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: OfferStatus.addOfferFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<void> updateOffer(
      int projectId, String offerDetails, int days,int offerId) async {
    emit(state.copyWith(status: OfferStatus.updateOfferLoading));

    try {
      final AddOfferRequestModel offerModel = AddOfferRequestModel(
        offerPrice: state.offerPrice!,
        projectId: projectId,
        proposalDescription: offerDetails,
        days: days,
      );

      final result = await _offerRepo.updateOffer(offerId,offerModel);
      emit(state.copyWith(
        status: OfferStatus.updateOfferSuccess,
        message: result,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: OfferStatus.updateOfferFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<void> deleteOffer(int id) async {
    emit(state.copyWith(status: OfferStatus.deleteOfferLoading));

    try {
      final result = await _offerRepo.deleteOffer(id: id);
      emit(state.copyWith(
        status: OfferStatus.deleteOfferSuccess,
        message: result,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: OfferStatus.deleteOfferFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  void setOfferPrice({double? price}) {
    emit(state.copyWith(offerPrice: price));
  }
}

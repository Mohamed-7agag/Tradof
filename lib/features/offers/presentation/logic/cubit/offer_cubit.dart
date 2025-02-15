import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/errors/exception.dart';
import 'package:tradof/features/offers/data/model/add_offer_request_model.dart';
import 'package:tradof/features/offers/data/repos/offer_repo.dart';

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

  void setOfferPrice({double? price}) {
    emit(state.copyWith(offerPrice: price));
  }
}

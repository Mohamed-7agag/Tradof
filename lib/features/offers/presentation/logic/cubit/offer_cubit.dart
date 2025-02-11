import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/features/offers/data/model/add_offer_request_model.dart';
import 'package:tradof/features/offers/data/repos/offer_repo.dart';

part 'offer_state.dart';

class OfferCubit extends Cubit<OfferState> {
  OfferCubit(this._offerRepo) : super(const OfferState());

  final OfferRepo _offerRepo;

  Future<void> addOffer(int projectId, String offerDetails, int days) async {
    emit(state.copyWith(status: OfferStatus.addOfferLoading));

    final AddOfferRequestModel offerModel = AddOfferRequestModel(
      offerPrice: state.offerPrice!,
      days: days,
      proposalDescription: offerDetails,
      projectId: projectId,
    );

    final result = await _offerRepo.addOffer(offerModel);
    result.fold(
      (failure) {
        emit(state.copyWith(
          status: OfferStatus.addOfferFailure,
          errorMessage: failure.errMessage,
        ));
      },
      (response) {
        emit(state.copyWith(
          status: OfferStatus.addOfferSucess,
          message: response,
        ));
      },
    );
  }

  void setOfferPrice({double? price}) {
    emit(state.copyWith(offerPrice: price));
  }
}

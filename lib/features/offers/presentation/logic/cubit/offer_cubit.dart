import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/exception.dart';
import '../../../../../core/helpers/prepare_files.dart';
import '../../../data/model/add_offer_request_model.dart';
import '../../../data/model/offer_model.dart';
import '../../../data/repos/offer_repo.dart';

part 'offer_state.dart';

class OfferCubit extends Cubit<OfferState> {
  OfferCubit(this._offerRepo) : super(const OfferState());

  final OfferRepo _offerRepo;

  Future<void> addOffer(
    int projectId,
    String offerDetails,
    int days, {
    List<PlatformFile>? files,
  }) async {
    emit(state.copyWith(status: OfferStatus.addOfferLoading));

    try {
      final AddOfferRequestModel offerModel = AddOfferRequestModel(
        offerPrice: state.offerPrice!,
        days: days,
        proposalDescription: offerDetails,
        projectId: projectId,
        proposalAttachments: await prepareFiles(files),
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

  Future<void> getAllOffers({bool loadMore = false})async
  {
    if (loadMore && state.hasReachedMax) return;

    final nextPageIndex = loadMore ? state.pageIndex + 1 : 1;

    emit(state.copyWith(status: OfferStatus.getAllOffersLoading));
    try {
      final response = await _offerRepo.getAllOffers(
        pageIndex: nextPageIndex, 
        pageSize: state.pageSize,
      );

      final newOffers = response.items;
      final hasReachedMax = newOffers.length < state.pageSize;

      emit(state.copyWith(
        status: OfferStatus.getAllOffersSuccess,
        allOffers: loadMore
            ? [...state.allOffers, ...newOffers]
            : newOffers,
        pageIndex: nextPageIndex,
        hasReachedMax: hasReachedMax,
        count: response.count,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: OfferStatus.getAllOffersFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<void> updateOffer(
      int projectId, String offerDetails, int days, int offerId) async {
    emit(state.copyWith(status: OfferStatus.updateOfferLoading));

    try {
      final AddOfferRequestModel offerModel = AddOfferRequestModel(
        offerPrice: state.offerPrice!,
        projectId: projectId,
        proposalDescription: offerDetails,
        days: days,
      );

      final result = await _offerRepo.updateOffer(offerId, offerModel);
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

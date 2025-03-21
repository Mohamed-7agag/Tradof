import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/exception.dart';
import '../../../../../core/helpers/prepare_files.dart';
import '../../../../../core/utils/app_constants.dart';
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

  Future<void> getAllOffers({bool loadMore = false}) async {
    if (loadMore && state.allOffersHasReachedMax) return;

    final nextPageIndex = loadMore ? state.allOffersPageIndex + 1 : 1;

    emit(state.copyWith(status: OfferStatus.getAllOffersLoading));
    try {
      final response = await _offerRepo.getAllOffers(
        freelancerId: AppConstants.kUserId,
        pageIndex: nextPageIndex,
        pageSize: state.allOffersPageSize,
      );

      final newOffers = response.items;
      log('newOffers: ${newOffers.toString()}');
      log('allOffers: ${state.allOffers.toString()}');
      final hasReachedMax = newOffers.length < state.allOffersPageSize;

      emit(state.copyWith(
        status: OfferStatus.getAllOffersSuccess,
        allOffers: loadMore ? [...state.allOffers, ...newOffers] : newOffers,
        allOffersPageIndex: nextPageIndex,
        allOffersHasReachedMax: hasReachedMax,
        allOffersCount: response.count,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: OfferStatus.getAllOffersFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<void> updateOffer(
    int projectId,
    String offerDetails,
    int days,
    int offerId,
  ) async {
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

  Future<void> getProjectOffers(int projectId, {bool loadMore = false}) async {
    if (loadMore && state.projectOffersHasReachedMax) return;

    final nextPageIndex = loadMore ? state.projectOffersPageIndex + 1 : 1;
    emit(state.copyWith(status: OfferStatus.getProjectOffersLoading));
    try {
      final response = await _offerRepo.getProjectOffers(
        projectId: projectId,
        pageIndex: nextPageIndex,
        pageSize: state.allOffersPageSize,
      );
      final newOffers = response.items;
      final hasReachedMax = newOffers.length < state.allOffersPageSize;
      emit(state.copyWith(
        status: OfferStatus.getProjectOffersSuccess,
        projectOffers:
            loadMore ? [...state.projectOffers, ...newOffers] : newOffers,
        projectOffersPageIndex: nextPageIndex,
        projectOffersHasReachedMax: hasReachedMax,
        projectOffersCount: response.count,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: OfferStatus.getProjectOffersFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<void> acceptOffer(int projectId, int offerId) async {
    emit(state.copyWith(status: OfferStatus.acceptOfferLoading));

    try {
      await _offerRepo.acceptOffer(projectId: projectId, offerId: offerId);
      emit(state.copyWith(
        status: OfferStatus.acceptOfferSuccess,
        message: 'Offer accepted successfully',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: OfferStatus.acceptOfferFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<void> denyOffer(int projectId, int offerId) async {
    emit(state.copyWith(status: OfferStatus.denyOfferLoading));

    try {
      await _offerRepo.denyOffer(projectId: projectId, offerId: offerId);
      emit(state.copyWith(
        status: OfferStatus.denyOfferSuccess,
        message: 'Offer denied successfully',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: OfferStatus.denyOfferFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }
}

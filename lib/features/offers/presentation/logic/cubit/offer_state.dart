part of 'offer_cubit.dart';

enum OfferStatus {
  initial,
  addOfferLoading,
  addOfferSuccess,
  addOfferFailure,
  updateOfferLoading,
  updateOfferSuccess,
  updateOfferFailure,
  deleteOfferLoading,
  deleteOfferSuccess,
  deleteOfferFailure,
  getAllOffersLoading,
  getAllOffersSuccess,
  getAllOffersFailure,
  getProjectOffersLoading,
  getProjectOffersSuccess,
  getProjectOffersFailure,
  acceptOfferLoading,
  acceptOfferSuccess,
  acceptOfferFailure,
  denyOfferLoading,
  denyOfferSuccess,
  denyOfferFailure,
  cancelOfferLoading,
  cancelOfferSuccess,
  cancelOfferFailure,
  setStatusIndex,
}

class OfferState extends Equatable {
  const OfferState({
    this.status = OfferStatus.initial,
    this.errorMessage = '',
    this.message = '',
    this.offerPrice,
    this.allOffers = const [],
    this.filteredOffers = const [],
    this.projectOffers = const [],
    this.allOffersPagination = const Pagination(),
    this.projectOffersPagination = const Pagination(),
    this.statusIndex,
  });

  final OfferStatus status;
  final String errorMessage;
  final String message;
  final double? offerPrice;
  final List<OfferModel> allOffers;
  final List<OfferModel> filteredOffers;
  final List<OfferModel> projectOffers;
  final Pagination allOffersPagination;
  final Pagination projectOffersPagination;
  final int? statusIndex;

  OfferState copyWith({
    OfferStatus? status,
    String? errorMessage,
    String? message,
    double? offerPrice,
    List<OfferModel>? allOffers,
    List<OfferModel>? projectOffers,
    List<OfferModel>? filteredOffers,
    Pagination? allOffersPagination,
    Pagination? projectOffersPagination,
    int? statusIndex,
  }) {
    return OfferState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      message: message ?? this.message,
      offerPrice: offerPrice ?? this.offerPrice,
      allOffers: allOffers ?? this.allOffers,
      filteredOffers: filteredOffers ?? this.filteredOffers,
      projectOffers: projectOffers ?? this.projectOffers,
      allOffersPagination: allOffersPagination ?? this.allOffersPagination,
      projectOffersPagination:
          projectOffersPagination ?? this.projectOffersPagination,
      statusIndex: statusIndex ?? this.statusIndex,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        message,
        offerPrice,
        allOffers,
        filteredOffers,
        projectOffers,
        allOffersPagination,
        projectOffersPagination,
        statusIndex,
      ];
}



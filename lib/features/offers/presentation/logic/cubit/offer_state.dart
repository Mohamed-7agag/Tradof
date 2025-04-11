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
  
}

class OfferState extends Equatable {
  const OfferState({
    this.status = OfferStatus.initial,
    this.errorMessage = '',
    this.message = '',
    this.offerPrice,
    this.allOffers = const [],
    this.projectOffers = const [],
    this.allOffersPagination = const Pagination(),
    this.projectOffersPagination = const Pagination(),
  });

  final OfferStatus status;
  final String errorMessage;
  final String message;
  final double? offerPrice;
  final List<OfferModel> allOffers;
  final List<OfferModel> projectOffers;
  final Pagination allOffersPagination;
  final Pagination projectOffersPagination;

  OfferState copyWith({
    OfferStatus? status,
    String? errorMessage,
    String? message,
    double? offerPrice,
    List<OfferModel>? allOffers,
    List<OfferModel>? projectOffers,
    Pagination? allOffersPagination,
    Pagination? projectOffersPagination,
  }) {
    return OfferState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      message: message ?? this.message,
      offerPrice: offerPrice ?? this.offerPrice,
      allOffers: allOffers ?? this.allOffers,
      projectOffers: projectOffers ?? this.projectOffers,
      allOffersPagination: allOffersPagination ?? this.allOffersPagination,
      projectOffersPagination:
          projectOffersPagination ?? this.projectOffersPagination,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        message,
        offerPrice,
        allOffers,
        projectOffers,
        allOffersPagination,
        projectOffersPagination,
      ];
}



part of 'offer_cubit.dart';

enum OfferStatus {
  initial,
  addOfferLoading,
  addOfferSucess,
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
}

extension OfferStatusExtension on OfferStatus {
  bool get isInitial => this == OfferStatus.initial;
  bool get isAddOfferLoading => this == OfferStatus.addOfferLoading;
  bool get isAddOfferSuccess => this == OfferStatus.addOfferSucess;
  bool get isAddOfferFailure => this == OfferStatus.addOfferFailure;
  bool get isUpdateOfferLoading => this == OfferStatus.updateOfferLoading;
  bool get isUpdateOfferSuccess => this == OfferStatus.updateOfferSuccess;
  bool get isUpdateOfferFailure => this == OfferStatus.updateOfferFailure;
  bool get isDeleteOfferLoading => this == OfferStatus.deleteOfferLoading;
  bool get isDeleteOfferSuccess => this == OfferStatus.deleteOfferSuccess;
  bool get isDeleteOfferFailure => this == OfferStatus.deleteOfferFailure;
  bool get isGetAllOffersLoading => this == OfferStatus.getAllOffersLoading;
  bool get isGetAllOffersSuccess => this == OfferStatus.getAllOffersSuccess;
  bool get isGetAllOffersFailure => this == OfferStatus.getAllOffersFailure;
  bool get isGetProjectOffersLoading =>
      this == OfferStatus.getProjectOffersLoading;
  bool get isGetProjectOffersSuccess =>
      this == OfferStatus.getProjectOffersSuccess;
  bool get isGetProjectOffersFailure =>
      this == OfferStatus.getProjectOffersFailure;
}

class OfferState extends Equatable {
  const OfferState({
    this.status = OfferStatus.initial,
    this.errorMessage = '',
    this.message = '',
    this.offerPrice,
    this.allOffers = const [],
    this.projectOffers = const [],
    this.allOffersPageIndex = 1,
    this.allOffersPageSize = 8,
    this.allOffersCount = 0,
    this.allOffersHasReachedMax = false,
    this.projectOffersPageIndex = 1,
    this.projectOffersPageSize = 8,
    this.projectOffersCount = 0,
    this.projectOffersHasReachedMax = false,
  });
  final OfferStatus status;
  final String errorMessage;
  final String message;
  final double? offerPrice;
  final List<OfferModel> allOffers;
  final List<OfferModel> projectOffers;
  final int allOffersPageIndex;
  final int allOffersPageSize;
  final int allOffersCount;
  final bool allOffersHasReachedMax;
  final int projectOffersPageIndex;
  final int projectOffersPageSize;
  final int projectOffersCount;
  final bool projectOffersHasReachedMax;

  OfferState copyWith({
    OfferStatus? status,
    String? errorMessage,
    String? message,
    double? offerPrice,
    List<OfferModel>? allOffers,
    List<OfferModel>? projectOffers,
    int? allOffersPageIndex,
    int? allOffersPageSize,
    int? allOffersCount,
    bool? allOffersHasReachedMax,
    int? projectOffersPageSize,
    int? projectOffersPageIndex,
    int? projectOffersCount,
    bool? projectOffersHasReachedMax,
  }) {
    return OfferState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      message: message ?? this.message,
      offerPrice: offerPrice ?? this.offerPrice,
      allOffers: allOffers ?? this.allOffers,
      projectOffers: projectOffers ?? this.projectOffers,
      allOffersPageIndex: allOffersPageIndex ?? this.allOffersPageIndex,
      allOffersPageSize: allOffersPageSize ?? this.allOffersPageSize,
      allOffersCount: allOffersCount ?? this.allOffersCount,
      allOffersHasReachedMax:
          allOffersHasReachedMax ?? this.allOffersHasReachedMax,
      projectOffersPageIndex:
          projectOffersPageIndex ?? this.projectOffersPageIndex,
      projectOffersPageSize:
          projectOffersPageSize ?? this.projectOffersPageSize,
      projectOffersCount: projectOffersCount ?? this.projectOffersCount,
      projectOffersHasReachedMax:
          projectOffersHasReachedMax ?? this.projectOffersHasReachedMax,
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
        allOffersPageIndex,
        allOffersPageSize,
        allOffersCount,
        allOffersHasReachedMax,
        projectOffersPageIndex,
        projectOffersHasReachedMax,
        projectOffersCount,
        projectOffersPageSize
      ];
}

import 'offer_cubit.dart';

extension OfferStatusExtension on OfferStatus {
  bool get isInitial => this == OfferStatus.initial;
  bool get isAddOfferLoading => this == OfferStatus.addOfferLoading;
  bool get isAddOfferSuccess => this == OfferStatus.addOfferSuccess;
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
  bool get isAcceptOfferLoading => this == OfferStatus.acceptOfferLoading;
  bool get isAcceptOfferSuccess => this == OfferStatus.acceptOfferSuccess;
  bool get isAcceptOfferFailure => this == OfferStatus.acceptOfferFailure;
  bool get isDenyOfferLoading => this == OfferStatus.denyOfferLoading;
  bool get isDenyOfferSuccess => this == OfferStatus.denyOfferSuccess;
  bool get isDenyOfferFailure => this == OfferStatus.denyOfferFailure;
  bool get isCancelOfferLoading => this == OfferStatus.cancelOfferLoading;
  bool get isCancelOfferSuccess => this == OfferStatus.cancelOfferSuccess;
  bool get isCancelOfferFailure => this == OfferStatus.cancelOfferFailure;
}

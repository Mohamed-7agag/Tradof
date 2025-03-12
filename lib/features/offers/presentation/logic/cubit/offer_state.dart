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
}

class OfferState extends Equatable {
  const OfferState({
    this.status = OfferStatus.initial,
    this.errorMessage = '',
    this.message = '',
    this.offerPrice,
  });
  final OfferStatus status;
  final String errorMessage;
  final String message;
  final double? offerPrice;

  OfferState copyWith({
    OfferStatus? status,
    String? errorMessage,
    String? message,
    double? offerPrice,
  }) {
    return OfferState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      message: message ?? this.message,
      offerPrice: offerPrice ?? this.offerPrice,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        message,
        offerPrice,
      ];
}

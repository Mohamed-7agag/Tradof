part of 'offer_cubit.dart';

enum OfferStatus {
  initial,
  addOfferLoading,
  addOfferSucess,
  addOfferFailure,
}

extension OfferStatusX on OfferStatus {
  bool get isAddOfferLoading => this == OfferStatus.addOfferLoading;
  bool get isAddOfferSuccess => this == OfferStatus.addOfferSucess;
  bool get isAddOfferFailure => this == OfferStatus.addOfferFailure;
  bool get isInitial => this == OfferStatus.initial;
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

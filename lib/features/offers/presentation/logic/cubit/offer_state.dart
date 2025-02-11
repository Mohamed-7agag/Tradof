part of 'offer_cubit.dart';

enum OfferStatus {
  initial,
  createOfferLoading,
  createOfferSucess,
  createOfferFailure,
}

extension OfferStatusX on OfferStatus {
  bool get isLoading => this == OfferStatus.createOfferLoading;
  bool get iscreateOfferSucess => this == OfferStatus.createOfferSucess;
  bool get isError => this == OfferStatus.createOfferFailure;
  bool get isInitial => this == OfferStatus.initial;
}

class OfferState extends Equatable {
  final OfferStatus status;
  final String errorMessage;

  const OfferState({
    this.status = OfferStatus.initial,
    this.errorMessage = '',
  });

  OfferState copyWith({
    OfferStatus? status,
    String? errorMessage,
  }) {
    return OfferState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage];
}

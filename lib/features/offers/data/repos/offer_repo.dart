import 'package:dartz/dartz.dart';
import 'package:tradof/core/errors/failure.dart';
import 'package:tradof/features/offers/data/model/create_offer_request_model.dart';

abstract class OfferRepo {
  Future<Either<Failure, String>> createOffer(CreateOfferRequestModel model);
}


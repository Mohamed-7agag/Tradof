import '../model/add_offer_request_model.dart';

abstract class OfferRepo {
  Future<String> addOffer(AddOfferRequestModel model);
}

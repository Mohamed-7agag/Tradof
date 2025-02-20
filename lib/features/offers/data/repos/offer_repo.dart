import '../model/add_offer_request_model.dart';

abstract class OfferRepo {
  Future<String> addOffer(AddOfferRequestModel model);

  Future<String> updateOffer(int offerId,AddOfferRequestModel model);

  Future<String> deleteOffer({required int id});
}

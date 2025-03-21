import '../model/add_offer_request_model.dart';
import '../model/offer_response_model.dart';

abstract class OfferRepo {
  Future<String> addOffer(AddOfferRequestModel model);

  Future<String> updateOffer(int offerId, AddOfferRequestModel model);

  Future<OfferResponseModel> getAllOffers({
    required int pageIndex,
    required int pageSize,
    required String freelancerId,
  });
  Future<OfferResponseModel> getProjectOffers({
    required int pageIndex,
    required int pageSize,
    required String projectId,
  });

  Future<String> deleteOffer({required int id});
}

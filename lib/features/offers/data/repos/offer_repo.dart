import '../model/add_offer_request_model.dart';
import '../model/offer_response_model.dart';

abstract class OfferRepo {
  Future<String> addOffer(AddOfferRequestModel model);

  Future<String> updateOffer(int offerId, AddOfferRequestModel model);

  Future<OfferResponseModel> getAllOffers({
    required int pageIndex,
    required int pageSize,
    required String freelancerId,
    int? status,
  });
  Future<OfferResponseModel> getProjectOffers({
    required int pageIndex,
    required int pageSize,
    required int projectId,
  });

  Future<String> deleteOffer({
    required int id,
  });

  Future<String> cancelOffer({
    required int id,
  });

  Future<void> acceptOffer({
    required int projectId,
    required int offerId,
  });
  Future<void> denyOffer({
    required int projectId,
    required int offerId,
  });
}

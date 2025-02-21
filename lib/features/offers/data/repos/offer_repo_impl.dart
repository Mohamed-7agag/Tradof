import '../../../../core/api/api_service.dart';
import '../../../../core/api/end_points.dart';
import '../model/add_offer_request_model.dart';
import 'offer_repo.dart';

class OfferRepoImpl implements OfferRepo {
  OfferRepoImpl({required this.apiServices});
  final ApiServices apiServices;

  @override
  Future<String> addOffer(AddOfferRequestModel model) async {
    return await apiServices.post(
      EndPoint.addOffer,
      data: model.toJson(),
    );
  }

  @override
  Future<String> updateOffer(int offerId, AddOfferRequestModel model) async {
    return await apiServices.put(
      EndPoint.updateProposal(),
      data: {
        "id": offerId,
        ...model.toJson(),
      },
    );
  }

  @override
  Future<String> deleteOffer({required int id}) async {
    return await apiServices.delete(
      EndPoint.deleteProposal(id),
    );
  }
}

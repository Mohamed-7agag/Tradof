import '../../../../core/api/api_service.dart';
import '../../../../core/api/end_points.dart';
import '../model/add_offer_request_model.dart';
import '../model/offer_response_model.dart';

import 'offer_repo.dart';

class OfferRepoImpl implements OfferRepo {
  OfferRepoImpl({required this.apiServices});
  final ApiServices apiServices;

  @override
  Future<String> addOffer(AddOfferRequestModel model) async {
    final response = await apiServices.post(
      EndPoint.offer,
      data: model.toJson(),
      isFormData: true,
    );
    return response['message'] ?? 'Success';
  }

  @override
  Future<String> updateOffer(int offerId, AddOfferRequestModel model) async {
    return await apiServices.put(EndPoint.offer, data: {
      "id": offerId,
      ...model.toJson(),
    });
  }

  @override
  Future<String> deleteOffer({required int id}) async {
    return await apiServices.delete(
      EndPoint.deleteOffer(id),
    );
  }

  @override
  Future<OfferResponseModel> getAllOffers({
    required String freelancerId,
    required int pageIndex,
    required int pageSize,
  }) async{
    final response= await apiServices.get(
      EndPoint.getProposalByFreelancerId(freelancerId),
      queryParameters: {
        'pageIndex': pageIndex,
        'pageSize': pageSize,
      },
    );
    return OfferResponseModel.fromJson(response);
  }
}

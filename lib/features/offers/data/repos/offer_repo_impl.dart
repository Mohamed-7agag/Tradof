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
    final response = await apiServices.delete(
      EndPoint.deleteOffer(id),
    );
    return response['message'] ?? 'Success';
  }

  @override
  Future<String> cancelOffer({required int id}) async {
    final response = await apiServices.post(
      EndPoint.cancelOffer(id),
    );
    return response['message'] ?? 'Success';
  }

  @override
  Future<OfferResponseModel> getAllOffers({
    required String freelancerId,
    required int pageIndex,
    required int pageSize,
    int? status,
  }) async {
    final response = await apiServices.get(
      EndPoint.getProposalByFreelancerId,
      queryParameters: {
        'freelancerId': freelancerId,
        'pageIndex': pageIndex,
        'pageSize': pageSize,
        'status': status,
      },
    );
    return OfferResponseModel.fromJson(response);
  }

  @override
  Future<OfferResponseModel> getProjectOffers({
    required int pageIndex,
    required int pageSize,
    required int projectId,
  }) async {
    final response = await apiServices.get(
      EndPoint.offer,
      queryParameters: {
        'projectId': projectId,
        'pageIndex': pageIndex,
        'pageSize': pageSize,
      },
    );
    return OfferResponseModel.fromJson(response);
  }

  @override
  Future<void> acceptOffer(
      {required int projectId, required int offerId}) async {
    await apiServices.post(EndPoint.acceptOffer, queryParameters: {
      'projectId': projectId,
      'proposalId': offerId,
    });
  }

  @override
  Future<void> denyOffer({required int projectId, required int offerId}) async {
    await apiServices.post(EndPoint.denyOffer, queryParameters: {
      'projectId': projectId,
      'proposalId': offerId,
    });
  }
}

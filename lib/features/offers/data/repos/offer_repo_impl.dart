import '../../../../core/api/api_service.dart';
import '../../../../core/api/end_points.dart';
import '../model/add_offer_request_model.dart';
import 'offer_repo.dart';

class OfferRepoImpl implements OfferRepo {

  OfferRepoImpl({required this.apiServices});
  final ApiServices apiServices;

  @override
  Future<String> addOffer(AddOfferRequestModel model) async {
    final response = await apiServices.post(
      EndPoint.addOffer,
      data: model.toJson(),
    );
    return response;
  }
}

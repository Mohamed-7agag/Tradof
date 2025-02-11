import 'package:dartz/dartz.dart';
import 'package:tradof/core/api/api_service.dart';
import 'package:tradof/core/api/end_points.dart';
import 'package:tradof/core/errors/failure.dart';
import 'package:tradof/core/helpers/handle_request_method.dart';
import 'package:tradof/features/offers/data/model/add_offer_request_model.dart';
import 'package:tradof/features/offers/data/repos/offer_repo.dart';

class OfferRepoImpl implements OfferRepo {
  final ApiServices apiServices;

  OfferRepoImpl({required this.apiServices});

  @override
  Future<Either<Failure, String>> addOffer(AddOfferRequestModel model) {
    return handleRequest(() async {
      final response = await apiServices.post(
        EndPoint.createOffer,
        data: model.toJson(),
      );
      return response;
    });
  }
}

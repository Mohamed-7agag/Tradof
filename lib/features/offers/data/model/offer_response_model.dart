import 'offer_model.dart';

class OfferResponseModel {
  final int pageIndex;
  final int pageSize;
  final int count;
  final List<OfferModel> items;
  
  OfferResponseModel({
    required this.pageIndex,
    required this.pageSize,
    required this.count,
    required this.items,
  });

  factory OfferResponseModel.fromJson(Map<String, dynamic> json) {
    return OfferResponseModel(
      pageIndex: json['pageIndex'],
      pageSize: json['pageSize'],
      count: json['count'],
      items: (json['items'] as List)
          .map((i) => OfferModel.fromJson(i))
          .toList(),
    );
  }
}
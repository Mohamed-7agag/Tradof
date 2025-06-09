//  {
//         "id": 35,
//         "ratingValue": 4,
//         "review": "Very professional freelancer with good technical skills. The project was completed on time with good quality. Would consider hiring again for similar projects.",
//         "projectId": 57,
//         "ratedToId": "b2bd131a-133c-40d8-bcc5-e1b62f45fa8a",
//         "ratedById": "cbe2805d-6670-4e7f-b6bf-0b9152df089f",
//         "ratedByName": "Ahmed Ali",
//         "ratedToName": "Yousef Ghareb",
//         "creationDate": "2025-06-02T21:30:00"
//     }
class RatingModel {
  final int id;
  final int ratingValue;
  final String review;
  final int projectId;
  final String ratedToId;
  final String ratedById;
  final String ratedByName;
  final String ratedToName;
  final String creationDate;

  RatingModel({
    required this.id,
    required this.ratingValue,
    required this.review,
    required this.projectId,
    required this.ratedToId,
    required this.ratedById,
    required this.ratedByName,
    required this.ratedToName,
    required this.creationDate,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        id: json['id'],
        ratingValue: json['ratingValue'],
        review: json['review'],
        projectId: json['projectId'],
        ratedToId: json['ratedToId'],
        ratedById: json['ratedById'],
        ratedByName: json['ratedByName'],
        ratedToName: json['ratedToName'],
        creationDate: json['creationDate'],
      );
}
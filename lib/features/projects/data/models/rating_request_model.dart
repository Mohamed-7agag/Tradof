// {
//   "ratingValue": 2,
//   "review": "Very Good Work",
//   "projectId": 64,
//   "ratedToId": "9977450e-04fe-4a3c-aa03-41bd135ebb06",
//   "ratedById": "8e5ce3fb-7f74-435d-9c13-ebe24c71dccf"
// }
class RatingRequestModel  {
  final double ratingValue;
  final String review;
  final int projectId;
  final String ratedToId;
  final String ratedById;

  const RatingRequestModel({
    required this.ratingValue,
    required this.review,
    required this.projectId,
    required this.ratedToId,
    required this.ratedById,
  });
 
 

   Map<String, dynamic> toJson() => {
        'ratingValue': ratingValue,
        'review': review,
        'projectId': projectId,
        'ratedToId': ratedToId,
        'ratedById': ratedById,
      };   

 
}
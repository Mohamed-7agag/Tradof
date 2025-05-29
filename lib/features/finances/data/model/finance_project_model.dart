class FinanceProjectModel {
  final UserModel user;
  final ProjectDataModel prjectData;
  final String? paymentStatus;

  FinanceProjectModel({
    required this.user,
    required this.prjectData,
    required this.paymentStatus,
  });

  factory FinanceProjectModel.fromJson(Map<String, dynamic> json) {
    return FinanceProjectModel(
      user: UserModel.fromJson(json['user']),
      prjectData: ProjectDataModel.fromJson(json['prjectData']),
      paymentStatus: json['paymentStatus'],
    );
  }
}

class UserModel {
  final String id;
  final String? profileImageUrl;
  final String firstName;
  final String lastName;

  UserModel({
    required this.id,
    required this.profileImageUrl,
    required this.firstName,
    required this.lastName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      profileImageUrl: json['profileImageUrl'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}

class ProjectDataModel {
  final int id;
  final String name;
  final num depoistPrice;
  final num deliveryTime;

  ProjectDataModel({
    required this.id,
    required this.name,
    required this.depoistPrice,
    required this.deliveryTime,
  });

  factory ProjectDataModel.fromJson(Map<String, dynamic> json) {
    return ProjectDataModel(
      id: json['id'],
      name: json['name'],
      depoistPrice: json['depoistPrice'],
      deliveryTime: json['deliveryTime'],
    );
  }
}

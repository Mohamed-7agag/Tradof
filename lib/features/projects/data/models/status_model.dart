class Status {
  final int value;
  final String name;

  Status({
    required this.value,
    required this.name,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      value: json['statusValue'],
      name: json['statusName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusValue': value,
      'statusName': name,
    };
  }
}

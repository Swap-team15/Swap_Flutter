class BikeResponse {
  final String? bikeId, userId, bikeName, bikeType, information;
  final int? price;

  BikeResponse({
    required this.bikeId,
    required this.userId,
    required this.bikeName,
    required this.bikeType,
    required this.information,
    required this.price,
  });

  factory BikeResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return BikeResponse(
      bikeId: json["bikeid"],
      userId: json["userid"],
      bikeName: json["bikename"],
      bikeType: json["biketype"],
      information: json["information"],
      price: json["price"],
    );
  }

  BikeResponse copyWith({
    String? bikeId,
    String? userId,
    String? bikeName,
    String? bikeType,
    String? information,
    int? price,
  }) {
    return BikeResponse(
      bikeId: bikeId ?? this.bikeId,
      userId: userId ?? this.userId,
      bikeName: bikeName ?? this.bikeName,
      bikeType: bikeType ?? this.bikeType,
      information: information ?? this.information,
      price: price ?? this.price,
    );
  }
}

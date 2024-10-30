import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swap/core/di/dio.dart';
import 'package:swap/model/bike_response.dart';

final bikeRepositoryProvider =
    Provider<BikeRepository>((ref) => BikeRepository());

class BikeRepository {
  Future<List<BikeResponse>> getBikeList() async {
    try {
      final response = await dio.get("/bike");

      return (response.data as List)
          .map((i) => BikeResponse.fromJson(i))
          .toList();
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<BikeResponse> getBikeDetail({required int id}) async {
    try {
      final response = await dio.get("/bike/$id");

      return BikeResponse.fromJson(response.data);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<void> postBike({
    required int id,
    required int price,
    required String location,
    required String accessory,
  }) async {
    try {
      Map<String, dynamic> data = {
        "price": price,
        "location": location,
        "accessory": accessory,
      };
      await dio.post(
        "/bike/$id/subscribe",
        data: data,
      );
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}

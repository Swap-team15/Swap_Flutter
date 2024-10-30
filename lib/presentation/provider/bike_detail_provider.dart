import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swap/controller/bike_repository.dart';
import 'package:swap/model/bike_response.dart';

final bikeDetailProvider =
    StateNotifierProvider<BikeDetailStateNotifier, BikeResponse>((ref) =>
        BikeDetailStateNotifier(repository: ref.watch(bikeRepositoryProvider)));

class BikeDetailStateNotifier extends StateNotifier<BikeResponse> {
  final BikeRepository _repository;

  BikeDetailStateNotifier({
    required BikeRepository repository,
  })  : _repository = repository,
        super(
          BikeResponse(
            bikeId: null,
            userId: null,
            bikeName: null,
            bikeType: null,
            information: null,
            price: null,
          ),
        );

  Future<void> execute({required int id}) async {
    try {
      final response = await _repository.getBikeDetail(id: id);
      state = state.copyWith(
        bikeId: response.bikeId,
        userId: response.userId,
        bikeName: response.bikeName,
        bikeType: response.bikeType,
        information: response.information,
        price: response.price,
      );
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}

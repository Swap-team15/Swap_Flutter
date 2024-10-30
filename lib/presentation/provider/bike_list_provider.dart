import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swap/controller/bike_repository.dart';
import 'package:swap/model/bike_response.dart';

final bikeListProvider =
    StateNotifierProvider<BikeListStateNotifier, List<BikeResponse>>((ref) =>
        BikeListStateNotifier(repository: ref.watch(bikeRepositoryProvider)));

class BikeListStateNotifier extends StateNotifier<List<BikeResponse>> {
  final BikeRepository _repository;

  BikeListStateNotifier({
    required BikeRepository repository,
  })  : _repository = repository,
        super(List.empty());

  Future<void> execute() async {
    try {
      final response = await _repository.getBikeList();
      state = response;
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}

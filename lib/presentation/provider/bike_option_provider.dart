import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swap/core/state/purchase_option.dart';

class BikeOptionNotifier extends StateNotifier<List<PurchaseOption>> {
  BikeOptionNotifier() : super([]);

  void addOption(PurchaseOption option) {
    // 이미 리스트에 있는지 확인하고 추가
    if (!state.contains(option)) {
      state = [...state, option]; // 새로운 리스트로 업데이트
    }
  }

  void removeOption(PurchaseOption option) {
    // 리스트에서 옵션 제거
    state = state.where((item) => item != option).toList();
  }

  int getTotalCost() {
    // 선택된 옵션들의 총 비용 계산
    return state.fold(0, (total, option) => total + int.parse(option.cost));
  }
}

// Provider 정의
final bikeOptionProvider = StateNotifierProvider<BikeOptionNotifier, List<PurchaseOption>>(
      (ref) => BikeOptionNotifier(),
);

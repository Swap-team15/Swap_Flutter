import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigatorController extends StateNotifier<int> {
  NavigatorController() : super(1);

  void changeType({required int index}) {
    state = index;
  }
}

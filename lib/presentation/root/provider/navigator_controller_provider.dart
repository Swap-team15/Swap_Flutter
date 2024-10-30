import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swap/presentation/root/provider/navigator_controller.dart';

final navigatorControllerProvider =
    StateNotifierProvider<NavigatorController, int>(
        (ref) => NavigatorController());

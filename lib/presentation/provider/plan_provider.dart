import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swap/core/state/plan_type.dart';
import 'package:swap/core/state/purchase_option.dart';

final planProvider = StateProvider<PlanType?>((ref) => null);

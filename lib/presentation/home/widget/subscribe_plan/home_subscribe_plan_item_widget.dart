import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swap/core/component/swap_gesture.dart';
import 'package:swap/core/constants/swap_style.dart';
import 'package:swap/core/state/plan_type.dart';
import 'package:swap/presentation/provider/plan_provider.dart';

class HomeSubscribePlanItemWidget extends ConsumerWidget {
  final int index;
  final String cost, title, caption;

  const HomeSubscribePlanItemWidget({
    super.key,
    required this.cost,
    required this.title,
    required this.caption,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plan = ref.watch(planProvider);
    final managePlan = ref.read(planProvider.notifier);
    return Container(
      width: 101,
      height: 150,
      decoration: BoxDecoration(
        color: SwapColor.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: plan?.index == index && plan != null ? SwapColor.blue : SwapColor.gray200,
          width: 1,
        ),
      ),
      child: SwapGesture(
        event: () => managePlan.state = PlanType.values.elementAt(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: SwapTextStyle.navi(
                color: SwapColor.black,
              ),
            ),
            Text(
              caption,
              style: SwapTextStyle.label(
                color: SwapColor.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                height: 0.5,
                width: 63,
                decoration: BoxDecoration(
                  color: SwapColor.gray200,
                  borderRadius: BorderRadius.circular(0.5),
                ),
              ),
            ),
            Text(
              cost,
              style: SwapTextStyle.label(
                color: SwapColor.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

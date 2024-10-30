import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swap/core/constants/swap_style.dart';
import 'package:swap/presentation/home/widget/purchase/home_purchase_finally_cost_widget.dart';
import 'package:swap/presentation/provider/bike_option_provider.dart';
import 'package:swap/presentation/provider/plan_provider.dart';

class HomePurchaseCostInfoWidget extends ConsumerWidget {
  const HomePurchaseCostInfoWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plan = ref.watch(planProvider);
    final option = ref.watch(bikeOptionProvider);
    final addOption = ref.read(bikeOptionProvider.notifier);

    // plan?.real가 null일 경우 0으로 처리
    final planCost = int.tryParse(plan?.real ?? '0') ?? 0;
    final totalCost = addOption.getTotalCost();
    const mileage = 100; // 마일리지

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: SwapColor.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "決裁情報",
              style: SwapTextStyle.titleSmall(
                color: SwapColor.black,
              ),
            ),
            const SizedBox(height: 16),
            HomePurchaseFinallyCostWidget(
              head: "${plan?.title}",
              cost: "${planCost}",
            ),
            const SizedBox(height: 12),
            HomePurchaseFinallyCostWidget(
              head: "アクセサリーです",
              cost: "${totalCost}",
            ),
            const SizedBox(height: 12),
            HomePurchaseFinallyCostWidget(
              head: "マイレージです",
              cost: "-$mileage",
              useMileage: true,
            ),
            const SizedBox(height: 12),
            HomePurchaseFinallyCostWidget(
              head: "総金額",
              cost: "${planCost + totalCost - mileage}",
            ),
          ],
        ),
      ),
    );
  }
}

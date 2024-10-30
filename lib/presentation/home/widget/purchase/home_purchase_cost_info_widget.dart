import 'package:flutter/material.dart';
import 'package:swap/core/constants/swap_style.dart';
import 'package:swap/presentation/home/widget/purchase/home_purchase_finally_cost_widget.dart';

class HomePurchaseCostInfoWidget extends StatelessWidget {
  const HomePurchaseCostInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
            const HomePurchaseFinallyCostWidget(
              head: "週に1回決済します",
              cost: "250",
            ),
            const SizedBox(height: 12),
            const HomePurchaseFinallyCostWidget(
              head: "アクセサリーです",
              cost: "1500",
            ),
            const SizedBox(height: 12),
            const HomePurchaseFinallyCostWidget(
              head: "マイレージです",
              cost: "-100",
              useMileage: true,
            ),
            const SizedBox(height: 12),
            const HomePurchaseFinallyCostWidget(
              head: "総金額",
              cost: "1650",
            ),
          ],
        ),
      ),
    );
  }
}

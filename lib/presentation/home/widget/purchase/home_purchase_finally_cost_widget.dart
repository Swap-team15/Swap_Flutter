import 'package:flutter/material.dart';
import 'package:swap/core/constants/swap_style.dart';

class HomePurchaseFinallyCostWidget extends StatelessWidget {
  final String head, cost;
  final bool? useMileage;

  const HomePurchaseFinallyCostWidget({
    super.key,
    required this.head,
    required this.cost,
    this.useMileage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          head,
          style: SwapTextStyle.bodyLarge(
            color: SwapColor.black,
          ),
        ),
        Text(
          "$cost ${useMileage! ? "M" : "円"}",
          style: SwapTextStyle.subTitle(
            color: SwapColor.black,
          ),
        ),
      ],
    );
  }
}

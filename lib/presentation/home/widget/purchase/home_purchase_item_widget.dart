import 'package:flutter/material.dart';
import 'package:swap/core/constants/swap_style.dart';

class HomePurchaseItemWidget extends StatelessWidget {
  const HomePurchaseItemWidget({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "アーバンバイク\nACE(Midnight black)",
              textAlign: TextAlign.center,
              style: SwapTextStyle.bodySmall(
                color: SwapColor.black,
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.5),
              child: Image.asset("$imageCoreAsset/bike_image.png"),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "購読料",
                  style: SwapTextStyle.bodyLarge(
                    color: SwapColor.black,
                  ),
                ),
                Text(
                  "1500円",
                  style: SwapTextStyle.subTitle(
                    color: SwapColor.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "お届け日",
                  style: SwapTextStyle.bodyLarge(
                    color: SwapColor.black,
                  ),
                ),
                Text(
                  "11/01(金)",
                  style: SwapTextStyle.subTitle(
                    color: SwapColor.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

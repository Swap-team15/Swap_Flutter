import 'package:flutter/material.dart';
import 'package:swap/core/component/swap_gesture.dart';
import 'package:swap/core/constants/swap_style.dart';

class HomePurchaseBikeItemWidget extends StatelessWidget {
  const HomePurchaseBikeItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: SwapColor.white,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: SwapColor.gray100,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "週末購読です",
              style: SwapTextStyle.label(
                color: SwapColor.blue,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "$imageCoreAsset/bike_image.png",
                  width: 75,
                  height: 52,
                ),
                Text(
                  "アーバンバイク\nACE(Midnight black)",
                  textAlign: TextAlign.end,
                  style: SwapTextStyle.bodySmall(color: SwapColor.black),
                ),
              ],
            ),
            Text(
              "+ 自転車ロックです",
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

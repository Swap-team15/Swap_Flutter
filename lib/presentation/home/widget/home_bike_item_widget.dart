import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swap/core/component/swap_gesture.dart';
import 'package:swap/core/constants/swap_style.dart';

class HomeBikeItemWidget extends StatelessWidget {
  final bool? hasOutline;

  const HomeBikeItemWidget({
    super.key,
    this.hasOutline = true,
  });

  @override
  Widget build(BuildContext context) {
    return SwapGesture(
      event: () => context.push("/purchaseSelectOption"),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: SwapColor.white,
          border: hasOutline!
              ? const Border(
                  top: BorderSide(
                    width: 1,
                    color: SwapColor.gray100,
                  ),
                )
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Row(
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
        ),
      ),
    );
  }
}

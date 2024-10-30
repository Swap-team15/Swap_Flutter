import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swap/core/component/swap_gesture.dart';
import 'package:swap/core/component/swap_outlined_button.dart';
import 'package:swap/core/constants/swap_style.dart';
import 'package:swap/core/di/swap_router.dart';

class HomeSubscribeWidget extends StatelessWidget {
  const HomeSubscribeWidget({super.key});

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
              "自転車",
              style: SwapTextStyle.titleSmall(
                color: SwapColor.main,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "これから購読しましょう！",
              style: SwapTextStyle.titleSmall(
                color: SwapColor.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "気軽な購読と返却で自由に自転\n車を交換し、非対面で自転車修\n理をしましょう！",
              style: SwapTextStyle.bodySmall(
                color: SwapColor.black,
              ),
            ),
            const SizedBox(height: 18),
            SwapGesture(
              event: () => context.push("/bikeList"),
              child: SwapButton(
                content: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 5),
                  child: Text(
                    "始めましょう",
                    style: SwapTextStyle.bodySmall(
                      color: SwapColor.main,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

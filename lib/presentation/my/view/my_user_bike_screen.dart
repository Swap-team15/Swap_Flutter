import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:swap/core/component/swap_app_bar.dart';
import 'package:swap/core/component/swap_gesture.dart';
import 'package:swap/core/constants/swap_style.dart';
import 'package:swap/core/layout/swap_layout.dart';

class MyUserBikeScreen extends StatelessWidget {
  const MyUserBikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SwapLayout(
      appBar: SwapAppBar(
        title: Text(
          "私の情報です",
          style: SwapTextStyle.bodyMedium(
            color: SwapColor.black,
          ),
        ),
        leading: SwapGesture(
          event: () => context.pop(),
          child: Center(
            child: SvgPicture.asset("$iconCoreAsset/left_arrow_icon.svg"),
          ),
        ),
      ),
      child: Container(
        color: SwapColor.white,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: SwapColor.white,
              ),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "お名前です",
                      style: SwapTextStyle.bodyLarge(
                        color: SwapColor.black,
                      ),
                    ),
                    Text(
                      "オ·ウンチャン",
                      style: SwapTextStyle.subTitle(
                        color: SwapColor.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: SwapColor.white,
              ),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "自転車ナンバー",
                      style: SwapTextStyle.bodyLarge(
                        color: SwapColor.black,
                      ),
                    ),
                    Text(
                      "品川区 12 - 11",
                      style: SwapTextStyle.subTitle(
                        color: SwapColor.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: SwapColor.white,
              ),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "パスワード",
                      style: SwapTextStyle.bodyLarge(
                        color: SwapColor.black,
                      ),
                    ),
                    Text(
                      "1004",
                      style: SwapTextStyle.subTitle(
                        color: SwapColor.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

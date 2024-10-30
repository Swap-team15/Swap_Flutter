import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:swap/core/component/swap_app_bar.dart';
import 'package:swap/core/component/swap_divider.dart';
import 'package:swap/core/component/swap_gesture.dart';
import 'package:swap/core/component/swap_outlined_button.dart';
import 'package:swap/core/constants/swap_style.dart';
import 'package:swap/core/layout/swap_layout.dart';
import 'package:swap/presentation/home/widget/purchase/home_purchase_finally_cost_widget.dart';

class MapPlacePurchaseScreen extends StatelessWidget {
  const MapPlacePurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SwapLayout(
      appBar: SwapAppBar(
        title: Text(
          "交換しましょう!",
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SwapGesture(
        event: () => context.push("/loading"),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SwapButton(
              width: MediaQuery.of(context).size.width,
              content: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  "自転車を借りることです",
                  textAlign: TextAlign.center,
                  style: SwapTextStyle.bodySmall(
                    color: SwapColor.main,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: SwapColor.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Column(
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
                ],
              ),
            ),
          ),
          SwapDivider(),
          Container(
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
                    head: "一時間あたりの利用料",
                    cost: "100",
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "予想使用時間",
                        style: SwapTextStyle.bodyLarge(
                          color: SwapColor.black,
                        ),
                      ),
                      Text(
                        "2 時間",
                        style: SwapTextStyle.subTitle(
                          color: SwapColor.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const HomePurchaseFinallyCostWidget(
                    head: "総金額",
                    cost: "200",
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "使用時間内に返却しない場合追加料金およびアプリの使用が制限されます",
              style: SwapTextStyle.label(
                color: SwapColor.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

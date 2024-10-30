import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:swap/core/component/swap_app_bar.dart';
import 'package:swap/core/component/swap_content_title_widget.dart';
import 'package:swap/core/component/swap_divider.dart';
import 'package:swap/core/component/swap_gesture.dart';
import 'package:swap/core/component/swap_outlined_button.dart';
import 'package:swap/core/constants/swap_style.dart';
import 'package:swap/core/layout/swap_layout.dart';
import 'package:swap/presentation/home/widget/home_bike_item_widget.dart';
import 'package:swap/presentation/home/widget/subscribe_plan/home_subscribe_plan_widget.dart';

class HomePurchaseSelectPlanScreen extends StatelessWidget {
  const HomePurchaseSelectPlanScreen({super.key});

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
        event: () => context.push("/purchase"),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SwapButton(
              width: MediaQuery.of(context).size.width,
              content: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  "次に進みましょう",
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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwapDivider(),
          SwapContentTitleWidget(text: "僕のバイクです"),
          HomeBikeItemWidget(hasOutline: false),
          SwapDivider(),
          HomeSubscribePlanWidget(),
        ],
      ),
    );
  }
}

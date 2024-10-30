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
import 'package:swap/core/state/purchase_option.dart';
import 'package:swap/presentation/home/widget/purchase/home_purchase_item_widget.dart';
import 'package:swap/presentation/home/widget/purchase/home_purchase_option_list_widget.dart';

class HomePurchaseSelectOptionScreen extends StatelessWidget {
  const HomePurchaseSelectOptionScreen({super.key});

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
        event: () => context.push("/purchaseSelectPlan"),
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
      child: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomePurchaseItemWidget(),
              const SwapDivider(),
              const SwapContentTitleWidget(text: "アクセサリーです"),
              const HomePurchaseOptionListWidget(),
              Container(
                height: 92,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: SwapColor.gray50),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

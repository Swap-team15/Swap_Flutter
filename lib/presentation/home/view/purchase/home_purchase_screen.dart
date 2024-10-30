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
import 'package:swap/presentation/home/widget/purchase/home_purchase_bike_item_widget.dart';
import 'package:swap/presentation/home/widget/purchase/home_purchase_cost_info_widget.dart';
import 'package:swap/presentation/home/widget/purchase/home_purchase_finally_cost_widget.dart';
import 'package:swap/presentation/home/widget/purchase/home_purchase_input_address_widget.dart';

class HomePurchaseScreen extends StatefulWidget {
  const HomePurchaseScreen({super.key});

  @override
  State<HomePurchaseScreen> createState() => _HomePurchaseScreenState();
}

class _HomePurchaseScreenState extends State<HomePurchaseScreen> {
  late TextEditingController _addressController;
  late TextEditingController _detailAddressController;

  late FocusNode _addressFocusNode;
  late FocusNode _detailAddressFocusNode;

  @override
  void initState() {
    super.initState();
    _addressController = TextEditingController();
    _detailAddressController = TextEditingController();

    _addressFocusNode = FocusNode();
    _detailAddressFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _addressController.dispose();
    _detailAddressController.dispose();

    _addressFocusNode.dispose();
    _detailAddressFocusNode.dispose();
    super.dispose();
  }

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
                  "決済を進めます",
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SwapDivider(),
            const SwapContentTitleWidget(text: "オプションの確認"),
            const HomePurchaseBikeItemWidget(),
            const SwapDivider(),
            const SwapContentTitleWidget(text: "お届け先の設定"),
            HomePurchaseInputAddressWidget(
              addressController: _addressController,
              detailAddressController: _detailAddressController,
              addressFocusNode: _addressFocusNode,
              detailAddressFocusNode: _detailAddressFocusNode,
            ),
            const SwapDivider(),
            const HomePurchaseCostInfoWidget(),
            const SizedBox(height: 95),
          ],
        ),
      ),
    );
  }
}

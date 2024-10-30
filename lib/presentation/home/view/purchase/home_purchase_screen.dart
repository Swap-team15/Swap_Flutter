import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:swap/controller/bike_repository.dart';
import 'package:swap/core/component/swap_app_bar.dart';
import 'package:swap/core/component/swap_content_title_widget.dart';
import 'package:swap/core/component/swap_divider.dart';
import 'package:swap/core/component/swap_gesture.dart';
import 'package:swap/core/component/swap_outlined_button.dart';
import 'package:swap/core/constants/swap_style.dart';
import 'package:swap/core/layout/swap_layout.dart';
import 'package:swap/presentation/home/widget/purchase/home_purchase_bike_item_widget.dart';
import 'package:swap/presentation/home/widget/purchase/home_purchase_cost_info_widget.dart';
import 'package:swap/presentation/home/widget/purchase/home_purchase_input_address_widget.dart';
import 'package:swap/presentation/provider/bike_list_provider.dart';
import 'package:swap/presentation/provider/bike_option_provider.dart';
import 'package:swap/presentation/provider/plan_provider.dart';

class HomePurchaseScreen extends ConsumerStatefulWidget {
  final int index;

  const HomePurchaseScreen({
    super.key,
    required this.index,
  });

  @override
  ConsumerState<HomePurchaseScreen> createState() => _HomePurchaseScreenState();
}

class _HomePurchaseScreenState extends ConsumerState<HomePurchaseScreen> {
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
  BikeRepository repository = BikeRepository();


  @override
  Widget build(BuildContext context) {
    final plan = ref.watch(planProvider);
    final option = ref.watch(bikeOptionProvider);
    final addOption = ref.read(bikeOptionProvider.notifier);

    // plan?.real가 null일 경우 0으로 처리
    final planCost = int.tryParse(plan?.real ?? '0') ?? 0;
    final totalCost = addOption.getTotalCost();
    const mileage = 100; // 마일리지
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
        event: () {
          repository.postBike(
            id: int.parse(ref.watch(bikeListProvider).elementAt(widget.index).bikeId!),
            price: planCost + totalCost - mileage,
            location: _addressController.text + _detailAddressController.text,
            accessory: option.first.name,
          );
          context.go("/loading");
        },
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
            HomePurchaseBikeItemWidget(index: widget.index),
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:swap/controller/bike_repository.dart';
import 'package:swap/core/component/swap_app_bar.dart';
import 'package:swap/core/component/swap_divider.dart';
import 'package:swap/core/component/swap_gesture.dart';
import 'package:swap/core/component/swap_outlined_button.dart';
import 'package:swap/core/constants/swap_style.dart';
import 'package:swap/core/layout/swap_layout.dart';
import 'package:swap/core/state/purchase_option.dart';
import 'package:swap/presentation/home/widget/purchase/home_purchase_finally_cost_widget.dart';
import 'package:swap/presentation/provider/bike_list_provider.dart';
import 'package:swap/presentation/provider/bike_option_provider.dart';
import 'package:swap/presentation/provider/plan_provider.dart';

class MapPlacePurchaseScreen extends ConsumerWidget {
  final int index;

  const MapPlacePurchaseScreen({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    BikeRepository repository = BikeRepository();
    final bike = ref.watch(bikeListProvider).elementAt(index);
    final plan = ref.watch(planProvider);
    final option = ref.watch(bikeOptionProvider);
    final addOption = ref.read(bikeOptionProvider.notifier);

    // plan?.real가 null일 경우 0으로 처리
    final planCost = int.tryParse(plan?.real ?? '0') ?? 0;
    final totalCost = addOption.getTotalCost();
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
            id: int.parse(ref.watch(bikeListProvider).elementAt(index).bikeId!),
            price: planCost + totalCost,
            location: "대전시 자전거 주차장",
            accessory: PurchaseOption.bicycleStrap.name,
          );
          context.go("/loading");
        },
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
                    "${bike.bikeType}\n${bike.bikeName}",
                    textAlign: TextAlign.center,
                    style: SwapTextStyle.bodySmall(
                      color: SwapColor.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13.5),
                    child: Image.asset("$imageCoreAsset/${bike.bikeId}.png"),
                  ),
                ],
              ),
            ),
          ),
          const SwapDivider(),
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

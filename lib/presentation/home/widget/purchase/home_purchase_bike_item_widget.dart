import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swap/core/component/swap_gesture.dart';
import 'package:swap/core/constants/swap_style.dart';
import 'package:swap/presentation/provider/bike_list_provider.dart';
import 'package:swap/presentation/provider/bike_option_provider.dart';
import 'package:swap/presentation/provider/plan_provider.dart';

class HomePurchaseBikeItemWidget extends ConsumerWidget {
  final int index;

  const HomePurchaseBikeItemWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bikeList = ref.watch(bikeListProvider).elementAt(index);
    final plan = ref.watch(planProvider);
    final option = ref.watch(bikeOptionProvider);
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
              plan!.title,
              style: SwapTextStyle.label(
                color: SwapColor.blue,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "$imageCoreAsset/${bikeList.bikeId}.png",
                  width: 75,
                  height: 52,
                ),
                Text(
                  "${bikeList.bikeType}\n${bikeList.bikeName}",
                  textAlign: TextAlign.end,
                  style: SwapTextStyle.bodySmall(color: SwapColor.black),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: option.length,
              itemBuilder: (context, index) {
                return Text(
                  "+ ${option[index].name}",
                  textAlign: TextAlign.end,
                  style: SwapTextStyle.label(
                    color: SwapColor.black,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

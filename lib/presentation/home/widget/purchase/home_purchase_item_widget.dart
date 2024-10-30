import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swap/core/constants/swap_style.dart';
import 'package:swap/presentation/provider/bike_list_provider.dart';

class HomePurchaseItemWidget extends ConsumerWidget {
  final int index;

  const HomePurchaseItemWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bike = ref.watch(bikeListProvider).elementAt(index);
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: SwapColor.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "購読料",
                  style: SwapTextStyle.bodyLarge(
                    color: SwapColor.black,
                  ),
                ),
                Text(
                  "${bike.price}円",
                  style: SwapTextStyle.subTitle(
                    color: SwapColor.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "お届け日",
                  style: SwapTextStyle.bodyLarge(
                    color: SwapColor.black,
                  ),
                ),
                Text(
                  "11/01(金)",
                  style: SwapTextStyle.subTitle(
                    color: SwapColor.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

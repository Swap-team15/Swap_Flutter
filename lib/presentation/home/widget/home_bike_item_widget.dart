import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:swap/core/component/swap_gesture.dart';
import 'package:swap/core/constants/swap_style.dart';
import 'package:swap/presentation/provider/bike_list_provider.dart';

class HomeBikeItemWidget extends ConsumerWidget {
  final int index;
  final bool? hasOutline;
  final Function? event;

  const HomeBikeItemWidget({
    super.key,
    required this.index,
    this.hasOutline = true,
    this.event,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bikeList = ref.watch(bikeListProvider);

    return SwapGesture(
      event: () => event == null ? context.push("/purchaseSelectOption", extra: index) : event!(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: SwapColor.white,
          border: hasOutline!
              ? const Border(
                  top: BorderSide(
                    width: 1,
                    color: SwapColor.gray100,
                  ),
                )
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "$imageCoreAsset/${bikeList.elementAt(index).bikeId}.png",                width: 75,
                height: 52,
              ),
              Text(
                "${bikeList.elementAt(index).bikeType}\n${bikeList.elementAt(index).bikeName}",
                textAlign: TextAlign.end,
                style: SwapTextStyle.bodySmall(color: SwapColor.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

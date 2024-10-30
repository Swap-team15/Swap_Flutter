import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swap/core/component/swap_gesture.dart';
import 'package:swap/core/constants/swap_style.dart';
import 'package:swap/core/state/purchase_option.dart';
import 'package:swap/presentation/provider/bike_option_provider.dart';

class HomePurchaseOptionListWidget extends ConsumerWidget {
  const HomePurchaseOptionListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectList = ref.watch(bikeOptionProvider);
    final manageList = ref.read(bikeOptionProvider.notifier);
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: PurchaseOption.values.length,
      itemBuilder: (context, index) {
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (selectList.contains(PurchaseOption.values.elementAt(index)))
                      SwapGesture(
                        event: () => manageList.removeOption(PurchaseOption.values.elementAt(index)),
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: SwapColor.blue,
                            borderRadius: BorderRadius.circular(4),
                            // border: Border.all(
                            //   width: 1,
                            //   color: SwapColor.gray300,
                            // ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child:
                                SvgPicture.asset("$iconCoreAsset/check_icon.svg"),
                          ),
                        ),
                      ),
                    if (!selectList.contains(PurchaseOption.values.elementAt(index)))
                      SwapGesture(
                        event: () => manageList.addOption(PurchaseOption.values.elementAt(index)),
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: SwapColor.white,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              width: 1,
                              color: SwapColor.gray300,
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(width: 24),
                    Image.asset(
                      PurchaseOption.values.elementAt(index).image,
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
                RichText(
                  textAlign: TextAlign.end,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "${PurchaseOption.values.elementAt(index).name}\n+${PurchaseOption.values.elementAt(index).cost}",
                        style: SwapTextStyle.bodySmall(
                          color: SwapColor.black,
                        ),
                      ),
                      TextSpan(
                        text: "円",
                        style: SwapTextStyle.span(
                          color: SwapColor.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

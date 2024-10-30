import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:swap/core/component/swap_app_bar.dart';
import 'package:swap/core/component/swap_gesture.dart';
import 'package:swap/core/constants/swap_style.dart';
import 'package:swap/core/layout/swap_layout.dart';
import 'package:swap/presentation/home/widget/home_bike_item_widget.dart';
import 'package:swap/presentation/provider/bike_list_provider.dart';

class HomeBikeListScreen extends ConsumerWidget {
  const HomeBikeListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bikeList = ref.watch(bikeListProvider);
    return SwapLayout(
      appBar: SwapAppBar(
        title: Text(
          "バイクの種類",
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
      child: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: bikeList.length,
          itemBuilder: (context, index) {
            return HomeBikeItemWidget(
              hasOutline: index == 0 ? false : true,
              index: index,
            );
          },
        ),
      ),
    );
  }
}

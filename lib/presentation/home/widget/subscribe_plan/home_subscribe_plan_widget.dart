import 'package:flutter/material.dart';
import 'package:swap/core/component/swap_content_title_widget.dart';
import 'package:swap/core/constants/swap_style.dart';
import 'package:swap/core/state/plan_type.dart';
import 'package:swap/presentation/home/widget/subscribe_plan/home_subscribe_plan_item_widget.dart';

class HomeSubscribePlanWidget extends StatelessWidget {
  const HomeSubscribePlanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SwapContentTitleWidget(text: "購読プランです"),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: SwapColor.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: PlanType.values
                  .asMap()
                  .entries
                  .map(
                    (e) => HomeSubscribePlanItemWidget(
                      index: e.value.index,
                      cost: e.value.cost,
                      title: e.value.title,
                      caption: e.value.caption,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

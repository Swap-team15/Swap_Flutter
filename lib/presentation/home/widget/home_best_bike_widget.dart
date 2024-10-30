import 'package:flutter/material.dart';
import 'package:swap/core/constants/swap_style.dart';
import 'package:swap/presentation/home/widget/home_bike_item_widget.dart';

class HomeBestBikeWidget extends StatelessWidget {
  const HomeBestBikeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: SwapColor.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Text(
              "ベスト5",
              style: SwapTextStyle.titleSmall(
                color: SwapColor.black,
              ),
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return const HomeBikeItemWidget();
          },
        ),
      ],
    );
  }
}

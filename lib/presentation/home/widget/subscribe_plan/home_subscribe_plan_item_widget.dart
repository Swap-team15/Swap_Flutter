import 'package:flutter/material.dart';
import 'package:swap/core/constants/swap_style.dart';

class HomeSubscribePlanItemWidget extends StatelessWidget {
  final String cost, title, caption;

  const HomeSubscribePlanItemWidget(
      {super.key, required this.cost, required this.title, required this.caption,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 101,
      height: 150,
      decoration: BoxDecoration(
        color: SwapColor.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: SwapColor.gray200,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: SwapTextStyle.navi(
              color: SwapColor.black,
            ),
          ),
          Text(
            caption,
            style: SwapTextStyle.label(
              color: SwapColor.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              height: 0.5,
              width: 63,
              decoration: BoxDecoration(
                color: SwapColor.gray200,
                borderRadius: BorderRadius.circular(0.5),
              ),
            ),
          ),
          Text(
            cost,
            style: SwapTextStyle.label(
              color: SwapColor.black,
            ),
          ),
        ],
      ),
    );
  }
}

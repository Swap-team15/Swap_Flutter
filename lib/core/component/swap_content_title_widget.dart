import 'package:flutter/material.dart';
import 'package:swap/core/constants/swap_style.dart';

class SwapContentTitleWidget extends StatelessWidget {
  final String text;

  const SwapContentTitleWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: SwapColor.white,
        border: Border(
          bottom: BorderSide(
            color: SwapColor.gray100,
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Text(
          text,
          style: SwapTextStyle.titleSmall(
            color: SwapColor.black,
          ),
        ),
      ),
    );
  }
}

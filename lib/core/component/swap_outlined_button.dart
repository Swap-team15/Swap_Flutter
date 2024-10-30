import 'package:flutter/material.dart';
import 'package:swap/core/constants/swap_style.dart';

class SwapButton extends StatelessWidget {
  final double? width, height;
  final Widget content;

  const SwapButton({
    super.key,
    this.height,
    this.width,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: SwapColor.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          width: 1,
          color: SwapColor.main,
        ),
      ),
      child: content,
    );
  }
}

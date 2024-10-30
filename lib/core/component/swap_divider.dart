import 'package:flutter/material.dart';
import 'package:swap/core/constants/swap_style.dart';

class SwapDivider extends StatelessWidget {
  const SwapDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: SwapColor.gray50,
      ),
    );
  }
}

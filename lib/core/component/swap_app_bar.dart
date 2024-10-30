import 'package:flutter/material.dart';
import 'package:swap/core/constants/swap_style.dart';

class SwapAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title, leading;

  const SwapAppBar({
    super.key,
    this.title,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          titleSpacing: 0,
          bottom: PreferredSize(
            preferredSize: preferredSize,
            child: Container(
              height: 1,
              decoration: const BoxDecoration(
                color: SwapColor.gray100,
              ),
            ),
          ),
          backgroundColor: SwapColor.white,
          centerTitle: true,
          title: title,
          leading: leading,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(58);
}

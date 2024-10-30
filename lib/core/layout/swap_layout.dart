import 'package:flutter/material.dart';
import 'package:swap/core/constants/swap_color.dart';

class SwapLayout extends StatelessWidget {
  final Color? backgroundColor;
  final PreferredSizeWidget? appBar;
  final Widget child;
  final Widget? floatingActionButton, bottomSheet, bottomNavigationBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const SwapLayout({
    super.key,
    required this.child,
    this.backgroundColor,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomSheet,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? SwapColor.white,
      appBar: appBar,
      body: SafeArea(
        bottom: false,
        child: Container(
          decoration: const BoxDecoration(
            color: SwapColor.gray50
          ),
          child: child,
        ),
      ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomSheet: bottomSheet,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

import 'package:flutter/material.dart';

class SwapGesture extends StatelessWidget {
  final Function event;
  final Widget child;

  const SwapGesture({
    super.key,
    required this.event,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => event(),
      child: child,
    );
  }
}

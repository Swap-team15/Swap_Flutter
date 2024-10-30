import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swap/core/component/swap_gesture.dart';
import 'package:swap/core/constants/swap_style.dart';
import 'package:swap/core/layout/swap_layout.dart';
import 'package:swap/core/state/root_type.dart';
import 'package:swap/presentation/root/provider/navigator_controller_provider.dart';
import 'package:swap/presentation/root/widget/root_navigation_item.dart';

class RootScreen extends ConsumerStatefulWidget {
  const RootScreen({super.key});

  @override
  ConsumerState<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends ConsumerState<RootScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
        length: RootType.values.length, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SwapLayout(
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 52,
          decoration: const BoxDecoration(
            color: SwapColor.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 62),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: RootType.values
                  .asMap()
                  .entries
                  .map(
                    (e) => SwapGesture(
                      event: () {
                        _controller.animateTo(e.value.index);
                        ref.read(navigatorControllerProvider.notifier).changeType(index: _controller.index);
                      },
                      child: RootNavigationItem(type: e.value),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        children:
            RootType.values.asMap().entries.map((e) => e.value.page).toList(),
      ),
    );
  }
}

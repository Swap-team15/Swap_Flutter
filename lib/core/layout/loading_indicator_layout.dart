import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:swap/core/component/swap_app_bar.dart';
import 'package:swap/core/component/swap_gesture.dart';
import 'package:swap/core/constants/swap_style.dart';
import 'package:swap/core/layout/swap_layout.dart';
import 'package:swap/presentation/root/provider/navigator_controller_provider.dart';

class LoadingIndicatorLayout extends ConsumerStatefulWidget {
  const LoadingIndicatorLayout({super.key});

  @override
  ConsumerState<LoadingIndicatorLayout> createState() => _LoadingIndicatorLayoutState();
}

class _LoadingIndicatorLayoutState extends ConsumerState<LoadingIndicatorLayout> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1700)).then((value) {
      ref.read(navigatorControllerProvider.notifier).changeType(index: 1);
      context.go("/root");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SwapLayout(
      appBar: SwapAppBar(
        title: Text(
          "交換しましょう!",
          style: SwapTextStyle.bodyMedium(
            color: SwapColor.black,
          ),
        ),
        leading: SwapGesture(
          event: () => context.pop(),
          child: Center(
            child: SvgPicture.asset("$iconCoreAsset/left_arrow_icon.svg"),
          ),
        ),
      ),
      child: Container(
        color: SwapColor.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 55),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 325,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage("$imageCoreAsset/loading_animation.gif"),
                  ),
                ),
              ),
              Text(
                "自転車を借りました！",
                style: SwapTextStyle.titleSmall(
                  color: SwapColor.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

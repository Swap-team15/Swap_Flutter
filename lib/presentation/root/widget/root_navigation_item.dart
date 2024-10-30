import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swap/core/constants/swap_style.dart';
import 'package:swap/core/state/root_type.dart';
import 'package:swap/presentation/root/provider/navigator_controller_provider.dart';

class RootNavigationItem extends ConsumerWidget {
  final RootType type;

  const RootNavigationItem({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigatorType = ref.watch(navigatorControllerProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          type.icon,
          colorFilter: ColorFilter.mode(
            type.index == navigatorType ? SwapColor.main : SwapColor.gray500,
            BlendMode.srcIn,
          ),
        ),
        Text(
          type.text,
          style: SwapTextStyle.navi(
            color: type.index == navigatorType ? SwapColor.main : SwapColor.gray500,
          ),
        ),
      ],
    );
  }
}

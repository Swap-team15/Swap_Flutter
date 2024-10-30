import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:swap/core/layout/swap_layout.dart';
import 'package:swap/presentation/provider/bike_list_provider.dart';

class Splash extends ConsumerStatefulWidget {
  const Splash({super.key});

  @override
  ConsumerState<Splash> createState() => _SplashState();
}

class _SplashState extends ConsumerState<Splash> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(bikeListProvider.notifier).execute();
    });
    Future.delayed(const Duration(milliseconds: 500)).then((value) => context.go("/root"));
  }

  @override
  Widget build(BuildContext context) {
    return SwapLayout(
      child: Container(
        color: Colors.white,
        child: const Column(
          children: [

          ],
        ),
      ),
    );
  }
}

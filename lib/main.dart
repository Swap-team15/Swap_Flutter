import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swap/core/constants/swap_style.dart';
import 'package:swap/core/di/swap_router.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: SwapColor.black,
          selectionColor: SwapColor.gray300
        ),
      ),
      routerConfig: swapRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}

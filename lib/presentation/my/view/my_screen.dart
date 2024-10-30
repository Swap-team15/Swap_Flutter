import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:swap/core/component/swap_app_bar.dart';
import 'package:swap/core/component/swap_gesture.dart';
import 'package:swap/core/constants/swap_style.dart';
import 'package:swap/core/layout/swap_layout.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return SwapLayout(
      appBar: SwapAppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Text(
                "マイページ",
                style: SwapTextStyle.titleSmall(
                  color: SwapColor.black,
                ),
              ),
            ],
          ),
        ),
      ),
      child: Container(
        color: SwapColor.white,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: SwapColor.white,
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: SwapColor.gray100,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  children: [
                    Text(
                      "オ·ウンチャン",
                      style: SwapTextStyle.bodyLarge(
                        color: SwapColor.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SwapGesture(
              event: () => context.push("/user"),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: SwapColor.white,
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: SwapColor.gray100,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "私の情報です",
                        style: SwapTextStyle.bodyLarge(
                          color: SwapColor.black,
                        ),
                      ),
                      SvgPicture.asset("$iconCoreAsset/right_arrow_icon.svg"),
                    ],
                  ),
                ),
              ),
            ),
            SwapGesture(
              event: () => context.push("/userBike"),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: SwapColor.white,
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: SwapColor.gray100,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "私の自転車です",
                        style: SwapTextStyle.bodyLarge(
                          color: SwapColor.black,
                        ),
                      ),
                      SvgPicture.asset("$iconCoreAsset/right_arrow_icon.svg"),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: SwapColor.white,
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: SwapColor.gray100,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "私の自転車を貸してあげます",
                      style: SwapTextStyle.bodyLarge(
                        color: SwapColor.black,
                      ),
                    ),
                    CupertinoSwitch(
                      activeColor: SwapColor.main,
                      thumbColor: SwapColor.white,
                      trackColor: const Color(0xFFB9B9BC),
                      value: state,
                      onChanged: (value) {
                        setState(() {
                          state = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swap/core/component/swap_gesture.dart';
import 'package:swap/core/constants/swap_style.dart';

class HomePageSlider extends StatefulWidget {
  const HomePageSlider({super.key});

  @override
  State<HomePageSlider> createState() => _HomePageSliderState();
}

class _HomePageSliderState extends State<HomePageSlider> {
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<String> images = [
    "$imageCoreAsset/bike_image.png",
        "$imageCoreAsset/105205.png",
    "$imageCoreAsset/133842.png",
    "$imageCoreAsset/236850.png",
    "$imageCoreAsset/266524.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 237,
      decoration: const BoxDecoration(color: SwapColor.white),
      child: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 62, vertical: 40),
                child: Image.asset(
                  images.elementAt(index),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SwapGesture(
                  event: () => _controller.animateTo(
                    -1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.linear,
                  ),
                  child: SvgPicture.asset("$iconCoreAsset/left_arrow_icon.svg"),
                ),
                SwapGesture(
                  event: () => _controller.animateTo(
                    0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.linear,
                  ),
                  child:
                      SvgPicture.asset("$iconCoreAsset/right_arrow_icon.svg"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

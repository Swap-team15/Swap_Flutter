import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 237,
      decoration: const BoxDecoration(
        color: SwapColor.white
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 62, vertical: 40),
                child: Image.asset(
                  "$imageCoreAsset/bike_image.png",
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset("$iconCoreAsset/left_arrow_icon.svg"),
                SvgPicture.asset("$iconCoreAsset/right_arrow_icon.svg")
              ],
            ),
          ),
        ],
      ),
    );
  }
}

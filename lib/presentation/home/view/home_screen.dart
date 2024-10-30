import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swap/core/component/swap_app_bar.dart';
import 'package:swap/core/component/swap_divider.dart';
import 'package:swap/core/constants/swap_style.dart';
import 'package:swap/core/layout/swap_layout.dart';
import 'package:swap/presentation/home/widget/home_best_bike_widget.dart';
import 'package:swap/presentation/home/widget/home_page_slider.dart';
import 'package:swap/presentation/home/widget/subscribe_plan/home_subscribe_plan_widget.dart';
import 'package:swap/presentation/home/widget/home_subscribe_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SwapLayout(
      appBar: SwapAppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Image.asset(
                "$imageHomeAsset/swap_image.png",
                width: 64,
                height: 31,
              ),
            ],
          ),
        ),
      ),
      child: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomePageSlider(),
            SwapDivider(),
            HomeSubscribeWidget(),
            SwapDivider(),
            HomeBestBikeWidget(),
            SwapDivider(),
            HomeSubscribePlanWidget(),
            SwapDivider(),
          ],
        ),
      ),
    );
  }
}

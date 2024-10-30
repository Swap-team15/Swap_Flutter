import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:swap/core/component/swap_app_bar.dart';
import 'package:swap/core/component/swap_gesture.dart';
import 'package:swap/core/constants/swap_style.dart';
import 'package:swap/core/layout/swap_layout.dart';
import 'package:swap/presentation/home/widget/home_bike_item_widget.dart';

class MapPlaceDetailScreen extends StatelessWidget {
  final String title, image;

  const MapPlaceDetailScreen({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SwapLayout(
      appBar: SwapAppBar(
        title: Text(
          title,
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 240,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage("$imagePlaceAsset/$image"),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Text(
                  "他人の自転車レンタル",
                  style: SwapTextStyle.subTitle(
                    color: SwapColor.black,
                  ),
                ),
              ),
            ),
            if (title == "日本橋二丁目地下駐輪場" || title == "COREDO日本橋駐輪場")
              Container(
                height: 400,
                color: SwapColor.white,
                child: Center(
                  child: Text(
                    "利用できる自転車がありません...",
                    style: SwapTextStyle.bodySmall(
                      color: SwapColor.black,
                    ),
                  ),
                ),
              ),
            if (title != "日本橋二丁目地下駐輪場" && title != "COREDO日本橋駐輪場")
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return HomeBikeItemWidget(
                    hasOutline: index == 0 ? false : true,
                    event: () => context.push("/placePurchase"),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

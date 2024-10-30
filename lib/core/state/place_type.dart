import 'package:flutter/cupertino.dart';

enum PlaceType {
  one(
    image: "one.jpg",
    title: "東京駅八重洲北口駐輪場",
  ),
  two(
    image: "two.jpg",
    title: "東京駅八重洲１丁目駐輪場",
  ),
  three(
    image: "three.png",
    title: "中央区立八重洲二丁目地下駐輪場",
  ),
  four(
    image: "four.jpg",
    title: "東京駅八重洲通り駐輪場B",
  ),
  five(
    image: "five.jpg",
    title: "日本橋二丁目地下駐輪場",
  ),
  six(
    image: "six.jpg",
    title: "COREDO日本橋駐輪場",
  ),
  seven(
    image: "seven.jpg",
    title: "日本橋高島屋SC･太陽生命日本橋ビル駐輪場",
  );

  final String image, title;

  const PlaceType({
    required this.image,
    required this.title,
  });
}

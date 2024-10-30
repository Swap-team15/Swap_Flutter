import 'package:flutter/material.dart';
import 'package:swap/core/constants/swap_asset.dart';
import 'package:swap/presentation/home/view/home_screen.dart';
import 'package:swap/presentation/map/view/map_screen.dart';
import 'package:swap/presentation/my/view/my_screen.dart';

enum RootType {
  map(
    text: "指導",
    icon: "$iconRootAsset/map_icon.svg",
    page: MapScreen(),
  ),
  home(
    text: "溝",
    icon: "$iconRootAsset/home_icon.svg",
    page: HomeScreen(),
  ),
  my(
    text: "私のです",
    icon: "$iconRootAsset/my_icon.svg",
    page: MyScreen(),
  );

  final String text, icon;
  final Widget page;

  const RootType({
    required this.text,
    required this.icon,
    required this.page,
  });
}

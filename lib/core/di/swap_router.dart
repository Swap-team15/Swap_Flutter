import 'package:go_router/go_router.dart';
import 'package:swap/core/layout/loading_indicator_layout.dart';
import 'package:swap/presentation/home/view/home_bike_list_screen.dart';
import 'package:swap/presentation/home/view/purchase/home_purchase_screen.dart';
import 'package:swap/presentation/home/view/purchase/home_purchase_select_option_screen.dart';
import 'package:swap/presentation/home/view/purchase/home_purchase_select_plan_screen.dart';
import 'package:swap/presentation/map/view/map_place_detail_screen.dart';
import 'package:swap/presentation/map/view/map_place_purchase_screen.dart';
import 'package:swap/presentation/my/view/my_user_bike_screen.dart';
import 'package:swap/presentation/my/view/my_user_info_screen.dart';
import 'package:swap/presentation/root/view/root_screen.dart';
import 'package:swap/presentation/splash.dart';

final swapRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
        path: "/",
        builder: (context, state) {
          return const Splash();
        }),
    GoRoute(
        path: "/root",
        builder: (context, state) {
          return const RootScreen();
        }),
    GoRoute(
      path: "/bikeList",
      builder: (context, state) {
        return const HomeBikeListScreen();
      },
    ),
    GoRoute(
      path: "/purchaseSelectOption",
      builder: (context, state) {
        return HomePurchaseSelectOptionScreen(index: state.extra as int);
      },
    ),
    GoRoute(
      path: "/purchaseSelectPlan",
      builder: (context, state) {
        return HomePurchaseSelectPlanScreen(index: state.extra as int);
      },
    ),
    GoRoute(
      path: "/purchase",
      builder: (context, state) {
        return HomePurchaseScreen(index: state.extra as int);
      },
    ),
    GoRoute(
      path: "/placeDetail",
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?; // extra를 Map으로 캐스팅
        final title = extra?["title"] as String; // title 가져오기
        final image = extra?["image"] as String; // image 가져오기

        return MapPlaceDetailScreen(
            image: image, title: title); // MapPlaceDetailScreen에 전달
      },
    ),
    GoRoute(
      path: "/placePurchase",
      builder: (context, state) {
        return MapPlacePurchaseScreen(index: state.extra as int);
      },
    ),
    GoRoute(
      path: "/loading",
      builder: (context, state) {
        return const LoadingIndicatorLayout();
      },
    ),
    GoRoute(
      path: "/user",
      builder: (context, state) {
        return const MyUserInfoScreen();
      },
    ),
    GoRoute(
      path: "/userBike",
      builder: (context, state) {
        return const MyUserBikeScreen();
      },
    ),
  ],
);

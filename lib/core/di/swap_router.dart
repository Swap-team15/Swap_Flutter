import 'package:go_router/go_router.dart';
import 'package:swap/presentation/home/view/home_bike_list_screen.dart';
import 'package:swap/presentation/home/view/purchase/home_purchase_screen.dart';
import 'package:swap/presentation/home/view/purchase/home_purchase_select_option_screen.dart';
import 'package:swap/presentation/home/view/purchase/home_purchase_select_plan_screen.dart';
import 'package:swap/presentation/root/view/root_screen.dart';

final swapRouter = GoRouter(
  initialLocation: "/root",
  routes: [
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
        return const HomePurchaseSelectOptionScreen();
      },
    ),
    GoRoute(
      path: "/purchaseSelectPlan",
      builder: (context, state) {
        return const HomePurchaseSelectPlanScreen();
      },
    ),
    GoRoute(
      path: "/purchase",
      builder: (context, state) {
        return const HomePurchaseScreen();
      },
    ),
  ],
);

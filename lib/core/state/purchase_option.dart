import 'package:swap/core/constants/swap_style.dart';

enum PurchaseOption {
  bicycleStrap(
    image: "$imagePurchaseAsset/bicycle_strap_image.png",
    name: "かごのひも",
    cost: "300",
  ),
  chainLock(
    image: "$imagePurchaseAsset/chain_lock_image.png",
    name: "自転車ロックです",
    cost: "1500",
  ),
  phoneStand(
    image: "$imagePurchaseAsset/phone_stand_image.png",
    name: "スマホスタンド",
    cost: "1200",
  ),
  helmet(
    image: "$imagePurchaseAsset/helmet_image.png",
    name: "ヘルメット",
    cost: "3000",
  ),
  raincoat(
    image: "$imagePurchaseAsset/raincoat_image.png",
    name: "アーバンバイク",
    cost: "500",
  );

  final String image, name, cost;

  const PurchaseOption({
    required this.image,
    required this.name,
    required this.cost,
  });
}

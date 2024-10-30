enum PlanType {
  work(
    cost: "1いち 500円",
    title: "週に1回決済します",
    caption: "通勤プランです",
  ),
  weekend(
    cost: "1いち 250円",
    title: "週に1回決済します",
    caption: "週末購読です",
  ),
  month(
    cost: "1かげつ 2000円",
    title: "月に一度決済します",
    caption: "1ヶ月購読します",
  );

  final String cost, title, caption;

  const PlanType({
    required this.cost,
    required this.title,
    required this.caption,
  });
}

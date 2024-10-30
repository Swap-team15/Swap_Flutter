enum PlanType {
  work(
    cost: "1いち 500円",
    real: "500",
    title: "週に1回決済します",
    caption: "通勤プランです",
  ),
  weekend(
    cost: "1いち 250円",
    real: "250",
    title: "週に1回決済します",
    caption: "週末購読です",
  ),
  month(
    cost: "1かげつ 2000円",
    real: "2000",
    title: "月に一度決済します",
    caption: "1ヶ月購読します",
  );

  final String cost, title, caption, real;

  const PlanType({
    required this.real,
    required this.cost,
    required this.title,
    required this.caption,
  });
}

class MonthlyPackage {
  String? title;
  String? description;
  double? price;

  MonthlyPackage({this.title, this.description, this.price});

  MonthlyPackage copyWith({
    String? title,
    String? description,
    double? price,
  }) =>
      MonthlyPackage(
        title: title ?? this.title,
        description: description ?? this.description,
        price: price ?? this.price,
      );
}

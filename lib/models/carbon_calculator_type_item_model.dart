class CarbonCalculatorTypeItemModel {
  CarbonCalculatorTypeItemModel({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory CarbonCalculatorTypeItemModel.fromJson(Map<String, dynamic> json) =>
      CarbonCalculatorTypeItemModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

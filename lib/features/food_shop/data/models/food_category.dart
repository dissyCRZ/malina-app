class FoodCategoryModel {
  final int id;
  final String name;
  final int supplier;
  FoodCategoryModel({
    required this.id,
    required this.name,
    required this.supplier,
  });

  factory FoodCategoryModel.fromMap(Map<String, dynamic> map) {
    return FoodCategoryModel(
      id: map['id'],
      name: map['name'],
      supplier: map['supplier'],
    );
  }
}

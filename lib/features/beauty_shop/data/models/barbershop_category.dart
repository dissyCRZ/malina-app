class BusinessCategoryModel {
  final int id;
  final String name;
  final String? icon;
  BusinessCategoryModel({
    required this.id,
    required this.name,
    this.icon,
  });
  factory BusinessCategoryModel.fromMap(Map<String, dynamic> map) {
    return BusinessCategoryModel(
      id: map['id'],
      name: map['name'],
      icon: map['icon'],
    );
  }
}

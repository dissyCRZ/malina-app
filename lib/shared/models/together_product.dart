class RelatedProduct {
  final int id;
  final String name;
  final int supplier;
  final double price;
  final String? image;
  final int? category;
  final double? discount;
  RelatedProduct({
    required this.id,
    required this.name,
    required this.supplier,
    required this.price,
    this.image,
    this.category,
    this.discount,
  });

  factory RelatedProduct.fromMap(Map<String, dynamic> map) {
    return RelatedProduct(
      id: map['id'],
      name: map['name'],
      supplier: map['supplier'],
      price: map['cost'],
      image: map['url'],
      category: map['category'],
      discount: map['prime_cost'],
    );
  }
}

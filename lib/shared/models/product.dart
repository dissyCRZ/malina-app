import 'package:malina_mobile_app/shared/models/together_product.dart';

abstract class AbstractProduct {
  final int id;
  final int supplierId;
  final String name;
  final double price;
  final List<double> sizeOptions;
  final String shortDescription;
  final String longDescription;
  final String? image;
  final int category;
  final double? discount;
  final double? cookTime;
  final List<RelatedProduct>? relatedProducts;
  AbstractProduct({
    required this.id,
    required this.supplierId,
    required this.name,
    required this.price,
    required this.sizeOptions,
    required this.shortDescription,
    required this.longDescription,
    this.image,
    required this.category,
    this.discount,
    this.cookTime,
    this.relatedProducts,
  });
}

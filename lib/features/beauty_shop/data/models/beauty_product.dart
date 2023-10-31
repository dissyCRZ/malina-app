import 'package:malina_mobile_app/shared/models/product.dart';
import 'package:malina_mobile_app/shared/models/together_product.dart';

class BeautyProductModel extends AbstractProduct {
  BeautyProductModel({
    required super.id,
    required super.supplierId,
    required super.name,
    required super.price,
    required super.sizeOptions,
    required super.shortDescription,
    required super.longDescription,
    required super.image,
    required super.category,
    super.relatedProducts,
  });
  factory BeautyProductModel.fromMap(Map<String, dynamic> map) {
    final images = map['beauty_product_images'];
    String? image;
    if (images != null && images is List && images.isNotEmpty) {
      image = images.first['image'];
    }
    return BeautyProductModel(
      id: map['id'],
      supplierId: map['supplier'],
      name: map['name'],
      sizeOptions: [map['volume']],
      shortDescription: map['description'],
      longDescription: map['description'],
      category: map['category'],
      price: map['cost'],
      image: image,
      relatedProducts: (map['related_products'] as List)
          .map(
            (e) => RelatedProduct.fromMap(
              e,
            ),
          )
          .toList(),
    );
  }
}

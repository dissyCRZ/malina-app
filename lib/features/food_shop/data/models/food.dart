import 'package:malina_mobile_app/shared/models/product.dart';
import 'package:malina_mobile_app/shared/models/together_product.dart';
import '../../../../shared/constants/random.dart';

class FoodModel extends AbstractProduct {
  FoodModel({
    required super.id,
    required super.supplierId,
    required super.name,
    required super.price,
    required super.sizeOptions,
    required super.shortDescription,
    required super.longDescription,
    required super.category,
    required super.cookTime,
    super.image,
    super.relatedProducts,
    super.discount,
  });
  factory FoodModel.fromMap(Map<String, dynamic> map) {
    final images = map['images'];
    String? image;
    if (images != null && images is List && images.isNotEmpty) {
      image = images.first;
    }
    return FoodModel(
      id: map['id'],
      supplierId: map['supplier']['id'],
      name: map['name'],
      sizeOptions: [map['gram']],
      shortDescription: map['description'],
      longDescription: map['description'],
      cookTime: random.nextInt(10) * 10 + 10,
      category: map['category']['id'],
      price: map['cost'],
      image: image,
      discount: map['prime_cost'],
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

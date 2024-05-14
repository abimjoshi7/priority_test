import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    required String name,
    required String image,
    required String description,
    required double price,
    required List<int> sizes,
    required int brandType,
    String? brandName,
    required int genderType,
    String? genderName,
    required List<int> colors,
    required double avgRating,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  factory Product.d() => const Product(
        id: -1,
        name: "",
        image: "",
        description: "",
        price: 0.0,
        sizes: [],
        brandType: 0,
        brandName: "",
        genderType: 0,
        genderName: "",
        colors: [],
        avgRating: 0.0,
      );
}

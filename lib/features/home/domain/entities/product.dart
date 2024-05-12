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
    required List<int> size,
    required int brandType,
    String? brandName,
    required int genderType,
    String? genderName,
    required List<int> colors,
    @Default(0) int reviewsCount,
    @Default(0.0) double avgRating,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

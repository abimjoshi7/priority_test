import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../home/domain/domain.dart';

part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required Product product,
    required int quantity,
    required int size,
    required int colorType,
    required String color,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}

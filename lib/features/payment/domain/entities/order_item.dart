import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_project/features/cart/domain/domain.dart';

part 'order_item.freezed.dart';
part 'order_item.g.dart';

@freezed
abstract class OrderItem with _$OrderItem {
  const factory OrderItem({
    required String orderId,
    required List<CartItem> cartItems,
    required double totalOrderPrice,
    required double additionalCharges,
    required String paymentMethod,
    required String location,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}

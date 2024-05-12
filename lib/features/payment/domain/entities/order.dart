import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_project/features/payment/domain/entities/order_item.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    required String id,
    required DateTime date,
    required List<OrderItem> items,
    required double totalPrice,
    required String shippingAddress,
    required String paymentMethod,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

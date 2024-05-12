import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../home/domain/domain.dart';

part 'order_item.freezed.dart';
part 'order_item.g.dart';

@freezed
abstract class OrderItem with _$OrderItem {
  const factory OrderItem({
    required Product product,
    required int quantity,
    required String size,
    required String color,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}

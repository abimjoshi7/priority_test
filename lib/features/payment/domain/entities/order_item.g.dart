// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderItemImpl _$$OrderItemImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemImpl(
      orderId: json['orderId'] as String,
      cartItems: (json['cartItems'] as List<dynamic>)
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalOrderPrice: (json['totalOrderPrice'] as num).toDouble(),
      additionalCharges: (json['additionalCharges'] as num).toDouble(),
      paymentMethod: json['paymentMethod'] as String,
      location: json['location'] as String,
    );

Map<String, dynamic> _$$OrderItemImplToJson(_$OrderItemImpl instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'cartItems': instance.cartItems,
      'totalOrderPrice': instance.totalOrderPrice,
      'additionalCharges': instance.additionalCharges,
      'paymentMethod': instance.paymentMethod,
      'location': instance.location,
    };

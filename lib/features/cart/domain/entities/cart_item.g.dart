// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartItemImpl _$$CartItemImplFromJson(Map<String, dynamic> json) =>
    _$CartItemImpl(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
      size: (json['size'] as num).toInt(),
      colorType: (json['colorType'] as num).toInt(),
      color: json['color'] as String,
    );

Map<String, dynamic> _$$CartItemImplToJson(_$CartItemImpl instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
      'size': instance.size,
      'colorType': instance.colorType,
      'color': instance.color,
    };

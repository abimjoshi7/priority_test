// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartItemImpl _$$CartItemImplFromJson(Map<String, dynamic> json) =>
    _$CartItemImpl(
      cartId: (json['cartId'] as num?)?.toInt() ?? 0,
      productId: (json['productId'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      size: (json['size'] as num).toInt(),
      colorType: (json['colorType'] as num).toInt(),
      color: json['color'] as String,
      image: json['image'] as String,
      brandName: json['brandName'] as String,
      price: (json['price'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
    );

Map<String, dynamic> _$$CartItemImplToJson(_$CartItemImpl instance) =>
    <String, dynamic>{
      'cartId': instance.cartId,
      'productId': instance.productId,
      'quantity': instance.quantity,
      'size': instance.size,
      'colorType': instance.colorType,
      'color': instance.color,
      'image': instance.image,
      'brandName': instance.brandName,
      'price': instance.price,
      'total': instance.total,
    };

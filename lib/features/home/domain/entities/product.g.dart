// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      sizes: (json['sizes'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      brandType: (json['brandType'] as num).toInt(),
      brandName: json['brandName'] as String?,
      genderType: (json['genderType'] as num).toInt(),
      genderName: json['genderName'] as String?,
      colors: (json['colors'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      avgRating: (json['avgRating'] as num).toDouble(),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'price': instance.price,
      'sizes': instance.sizes,
      'brandType': instance.brandType,
      'brandName': instance.brandName,
      'genderType': instance.genderType,
      'genderName': instance.genderName,
      'colors': instance.colors,
      'avgRating': instance.avgRating,
    };

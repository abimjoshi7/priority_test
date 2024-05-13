// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      userId: (json['userId'] as num).toInt(),
      productId: (json['productId'] as num).toInt(),
      rating: (json['rating'] as num).toDouble(),
      comment: json['comment'] as String?,
      createdDate: DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'productId': instance.productId,
      'rating': instance.rating,
      'comment': instance.comment,
      'createdDate': instance.createdDate.toIso8601String(),
    };

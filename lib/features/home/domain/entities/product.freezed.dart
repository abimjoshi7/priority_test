// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  List<int> get sizes => throw _privateConstructorUsedError;
  int get brandType => throw _privateConstructorUsedError;
  String? get brandName => throw _privateConstructorUsedError;
  int get genderType => throw _privateConstructorUsedError;
  String? get genderName => throw _privateConstructorUsedError;
  List<int> get colors => throw _privateConstructorUsedError;
  double get avgRating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {int id,
      String name,
      String image,
      String description,
      double price,
      List<int> sizes,
      int brandType,
      String? brandName,
      int genderType,
      String? genderName,
      List<int> colors,
      double avgRating});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
    Object? description = null,
    Object? price = null,
    Object? sizes = null,
    Object? brandType = null,
    Object? brandName = freezed,
    Object? genderType = null,
    Object? genderName = freezed,
    Object? colors = null,
    Object? avgRating = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      sizes: null == sizes
          ? _value.sizes
          : sizes // ignore: cast_nullable_to_non_nullable
              as List<int>,
      brandType: null == brandType
          ? _value.brandType
          : brandType // ignore: cast_nullable_to_non_nullable
              as int,
      brandName: freezed == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String?,
      genderType: null == genderType
          ? _value.genderType
          : genderType // ignore: cast_nullable_to_non_nullable
              as int,
      genderName: freezed == genderName
          ? _value.genderName
          : genderName // ignore: cast_nullable_to_non_nullable
              as String?,
      colors: null == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<int>,
      avgRating: null == avgRating
          ? _value.avgRating
          : avgRating // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String image,
      String description,
      double price,
      List<int> sizes,
      int brandType,
      String? brandName,
      int genderType,
      String? genderName,
      List<int> colors,
      double avgRating});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
    Object? description = null,
    Object? price = null,
    Object? sizes = null,
    Object? brandType = null,
    Object? brandName = freezed,
    Object? genderType = null,
    Object? genderName = freezed,
    Object? colors = null,
    Object? avgRating = null,
  }) {
    return _then(_$ProductImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      sizes: null == sizes
          ? _value._sizes
          : sizes // ignore: cast_nullable_to_non_nullable
              as List<int>,
      brandType: null == brandType
          ? _value.brandType
          : brandType // ignore: cast_nullable_to_non_nullable
              as int,
      brandName: freezed == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String?,
      genderType: null == genderType
          ? _value.genderType
          : genderType // ignore: cast_nullable_to_non_nullable
              as int,
      genderName: freezed == genderName
          ? _value.genderName
          : genderName // ignore: cast_nullable_to_non_nullable
              as String?,
      colors: null == colors
          ? _value._colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<int>,
      avgRating: null == avgRating
          ? _value.avgRating
          : avgRating // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  const _$ProductImpl(
      {required this.id,
      required this.name,
      required this.image,
      required this.description,
      required this.price,
      required final List<int> sizes,
      required this.brandType,
      this.brandName,
      required this.genderType,
      this.genderName,
      required final List<int> colors,
      required this.avgRating})
      : _sizes = sizes,
        _colors = colors;

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String image;
  @override
  final String description;
  @override
  final double price;
  final List<int> _sizes;
  @override
  List<int> get sizes {
    if (_sizes is EqualUnmodifiableListView) return _sizes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sizes);
  }

  @override
  final int brandType;
  @override
  final String? brandName;
  @override
  final int genderType;
  @override
  final String? genderName;
  final List<int> _colors;
  @override
  List<int> get colors {
    if (_colors is EqualUnmodifiableListView) return _colors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colors);
  }

  @override
  final double avgRating;

  @override
  String toString() {
    return 'Product(id: $id, name: $name, image: $image, description: $description, price: $price, sizes: $sizes, brandType: $brandType, brandName: $brandName, genderType: $genderType, genderName: $genderName, colors: $colors, avgRating: $avgRating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality().equals(other._sizes, _sizes) &&
            (identical(other.brandType, brandType) ||
                other.brandType == brandType) &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName) &&
            (identical(other.genderType, genderType) ||
                other.genderType == genderType) &&
            (identical(other.genderName, genderName) ||
                other.genderName == genderName) &&
            const DeepCollectionEquality().equals(other._colors, _colors) &&
            (identical(other.avgRating, avgRating) ||
                other.avgRating == avgRating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      image,
      description,
      price,
      const DeepCollectionEquality().hash(_sizes),
      brandType,
      brandName,
      genderType,
      genderName,
      const DeepCollectionEquality().hash(_colors),
      avgRating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  const factory _Product(
      {required final int id,
      required final String name,
      required final String image,
      required final String description,
      required final double price,
      required final List<int> sizes,
      required final int brandType,
      final String? brandName,
      required final int genderType,
      final String? genderName,
      required final List<int> colors,
      required final double avgRating}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get image;
  @override
  String get description;
  @override
  double get price;
  @override
  List<int> get sizes;
  @override
  int get brandType;
  @override
  String? get brandName;
  @override
  int get genderType;
  @override
  String? get genderName;
  @override
  List<int> get colors;
  @override
  double get avgRating;
  @override
  @JsonKey(ignore: true)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

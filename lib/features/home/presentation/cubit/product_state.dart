part of 'product_cubit.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;
  const factory ProductState.loading() = _Loading;
  const factory ProductState.success({
    required List<Product> products,
  }) = _Success;
  const factory ProductState.failure([
    Exception? exception,
  ]) = _Failure;
}

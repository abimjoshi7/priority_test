part of 'review_cubit.dart';

@freezed
class ReviewState with _$ReviewState {
  const factory ReviewState.initial() = _Initial;
  const factory ReviewState.loading() = _Loading;
  const factory ReviewState.success(
    List<Review> reviews,
  ) = _Success;
  const factory ReviewState.failure([
    Exception? exception,
  ]) = _Failure;
}

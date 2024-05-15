part of 'filter_cubit.dart';

@freezed
class FilterState with _$FilterState {
  const factory FilterState.initial({
    bool? isLowestPrice,
    bool? isHighestReview,
    bool? isMostRecent,
    int? genderType,
    int? colorType,
    double? startPrice,
    double? endPrice,
  }) = _Initial;
}

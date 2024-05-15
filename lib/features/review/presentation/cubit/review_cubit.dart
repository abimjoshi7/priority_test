import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/domain.dart';

part 'review_cubit.freezed.dart';
part 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit(
    this.addReview,
    this.getReviews,
  ) : super(const ReviewState.initial());

  final AddReview addReview;
  final GetReviews getReviews;

  Future<void> fetchReviews() async {
    emit(
      const ReviewState.loading(),
    );
    return getReviews.call(unit).then(
          (value) => switch (value) {
            Right<Exception, List<Review>>(:final value) => emit(
                ReviewState.success(value),
              ),
            Left<Exception, List<Review>>(:final value) => emit(
                ReviewState.failure(
                  value,
                ),
              ),
          },
        );
  }

  Future<void> insertReview(Review review) async {
    emit(
      const ReviewState.loading(),
    );
    return addReview.call(review).then(
          (value) => switch (value) {
            Right<Exception, int>() => fetchReviews(),
            Left<Exception, int>(:final value) => emit(
                ReviewState.failure(
                  value,
                ),
              ),
          },
        );
  }

  List<Review> getReviewList([int? productId]) {
    return state.maybeMap(
      success: (value) => value.reviews
          .where(
            (element) =>
                productId == null ? true : element.productId == productId,
          )
          .toList(),
      orElse: () => <Review>[],
    );
  }

  int getReviewCount(int productId) {
    try {
      final list = getReviewList();
      return list
          .where((element) => element.productId == productId)
          .toList()
          .length;
    } catch (e) {
      return 0;
    }
  }

  List<Review> reviewStarsFiltered(int productId, int index) {
    try {
      if (index >= 1 && index <= 5) {
        var newList = getReviewList()
            .where((element) =>
                element.productId == productId && element.rating == index)
            .toList();
        return newList;
      } else {
        return getReviewList(productId);
      }
    } catch (e) {
      return getReviewList(productId);
    }
  }
}

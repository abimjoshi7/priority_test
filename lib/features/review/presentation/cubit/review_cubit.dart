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
                ReviewState.success(
                  value,
                ),
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

  List<Review> getReviewList() {
    return state.maybeMap(
      success: (value) => value.reviews,
      orElse: () => [],
    );
  }

  // Product fetchProduct(int id) {
  //   final products = getProductList();
  //   return products.firstWhere((element) => element.id == id);
  // }

  // void filterBrand(int index) async {
  //   try {
  //     await fetchProducts();
  //     if (index != 0) {
  //       var newList = getProductList()
  //           .where((element) => element.brandType == index)
  //           .toList();
  //       emit(
  //         ProductState.success(
  //           newList,
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     emit(
  //       ProductState.failure(
  //         Exception(e.toString()),
  //       ),
  //     );
  //   }
  // }

  // Future<int> getItemCount([int? brandType]) async => fetchProducts().then(
  //       (_) {
  //         final list = getProductList()
  //             .where((element) =>
  //                 brandType == null ? true : element.brandType == brandType)
  //             .toList();
  //         return list.length;
  //       },
  //     );
}

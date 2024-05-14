import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

import 'package:test_project/enums.dart';
import 'package:test_project/features/review/domain/domain.dart';
import 'package:test_project/features/review/presentation/cubit/review_cubit.dart';
import 'package:test_project/res/res.dart';
import 'package:test_project/util/util.dart';

import '../../../../home/presentation/presentation.dart';

class ReviewListView extends HookWidget {
  const ReviewListView({
    super.key,
    required this.productIdAndPage,
    required this.reviewIndex,
  });

  final (int, bool) productIdAndPage;
  final int reviewIndex;

  @override
  Widget build(BuildContext context) {
    final (productId, isMainPage) = productIdAndPage;
    return BlocBuilder<ReviewCubit, ReviewState>(
      builder: (context, state) {
        var reviewList = context.read<ReviewCubit>().reviewStarsFiltered(
              productId,
              reviewIndex,
            );
        return Column(
          children: [
            CustomSection(
              label: isMainPage
                  ? null
                  : "${StringRes.kReviews} (${context.read<ReviewCubit>().getReviewCount(
                        productId,
                      )})",
              child: reviewList.isEmpty
                  ? const EmptyWidget()
                  : Column(
                      children: List.generate(
                        isMainPage
                            ? reviewList.length
                            : reviewList.length > 3
                                ? 3
                                : reviewList.length,
                        (index) => ReviewTile(
                          review: reviewList[index],
                        ),
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }
}

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            ImageRes.kEmptyVector,
          ),
          Text(
            "No elements found.",
            style: context.headlineMedium,
          ),
        ],
      ),
    );
  }
}

class ReviewTile extends StatelessWidget {
  const ReviewTile({super.key, required this.review});

  final Review review;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text(DummyUser.values
              //     .firstWhere((element) => element.id == review.userId)
              //     .name),
              Text(
                review.createdDate.compareWithToday(),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
            ),
            child: Row(
              children: List.generate(
                review.rating.floor(),
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: SvgPicture.asset(DrawableRes.kIconStars),
                ),
              ),
            ),
          ),
          Text(
            review.comment ?? "",
          ),
        ],
      ),
    );
  }
}

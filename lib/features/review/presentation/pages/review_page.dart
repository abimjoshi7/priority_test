import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/core/core.dart';

import 'package:test_project/core/enums/enums.dart';
import 'package:test_project/features/features.dart';
import 'package:test_project/core/res/res.dart';

class ReviewPage extends HookWidget {
  const ReviewPage({
    super.key,
    required this.productId,
  });

  final int productId;

  @override
  Widget build(BuildContext context) {
    final tabController =
        useTabController(initialLength: ReviewNumbers.values.length);

    return BlocBuilder<ReviewCubit, ReviewState>(
      builder: (context, state) {
        final reviewCount =
            context.read<ReviewCubit>().getReviewCount(productId);
        final avgReview = context.read<ProductCubit>().getAvgReview(productId);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("${StringRes.kReviews} ($reviewCount)"),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      DrawableRes.kIconStars,
                      fit: BoxFit.cover,
                      height: 18,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    FutureBuilder<num>(
                      future: avgReview,
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data?.toString() ?? "",
                          style: context.headlineSmall,
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
          body: Column(
            children: [
              TabBar(
                isScrollable: true,
                controller: tabController,
                tabs: ReviewNumbers.values
                    .map(
                      (e) => Tab(
                        text: e.label,
                      ),
                    )
                    .toList(),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: List.generate(
                    tabController.length,
                    (index) => SingleChildScrollView(
                      child: ReviewListView(
                        productIdAndPage: (
                          productId,
                          true,
                        ),
                        reviewIndex: tabController.length - index,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

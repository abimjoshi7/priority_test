import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:test_project/enums.dart';
import 'package:test_project/features/features.dart';
import 'package:test_project/features/review/presentation/cubit/review_cubit.dart';
import 'package:test_project/res/res.dart';

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
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(StringRes.kReviews),
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

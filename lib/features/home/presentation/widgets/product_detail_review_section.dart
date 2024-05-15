import 'package:flutter/material.dart';
import 'package:test_project/core/core.dart';
import 'package:test_project/features/features.dart';

class ProductDetailReviewSection extends StatelessWidget {
  const ProductDetailReviewSection({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReviewListView(
          productIdAndPage: (product.id, false),
          reviewIndex: 0,
        ),
        SizedBox(
          width: context.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: OutlinedButton(
              onPressed: () => Navigator.pushNamed(
                context,
                RouteRes.kReviewPage,
                arguments: product.id,
              ),
              child: const Text(StringRes.kSeeAllReview),
            ),
          ),
        ),
      ],
    );
  }
}

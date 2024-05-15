import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/core/core.dart';
import 'package:test_project/features/features.dart';

class ProductDetailTitleSection extends StatelessWidget {
  const ProductDetailTitleSection({
    super.key,
    required this.product,
    required this.selectedSize,
  });

  final Product product;
  final ValueNotifier<int> selectedSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name,
            style: context.headlineSmall,
          ),
          Row(
            children: [
              Row(
                children: [
                  ...List.generate(
                    product.avgRating.floor(),
                    (index) => Padding(
                      padding: const EdgeInsets.only(
                        right: 4,
                      ),
                      child: SvgPicture.asset(
                        DrawableRes.kIconStars,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      product.avgRating.toStringAsFixed(2),
                      style: context.labelMedium,
                    ),
                  ),
                ],
              ),
              Text(
                "(${context.read<ReviewCubit>().getReviewCount(product.id)} Reviews)",
                style: context.labelMedium
                    ?.copyWith(color: context.onContainerColor),
              )
            ],
          )
        ],
      ),
    );
  }
}

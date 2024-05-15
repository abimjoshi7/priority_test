import 'package:flutter/material.dart';
import 'package:test_project/core/core.dart';
import 'package:test_project/features/features.dart';
import 'package:test_project/widgets/widgets.dart';

class ProductDetailDescriptionSection extends StatelessWidget {
  const ProductDetailDescriptionSection({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      label: StringRes.kDescription,
      child: Text(product.description),
    );
  }
}

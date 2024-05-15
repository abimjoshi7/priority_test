import 'package:flutter/material.dart';
import 'package:test_project/core/core.dart';
import 'package:test_project/features/features.dart';
import 'package:test_project/widgets/widgets.dart';

class ProductDetailSizeSection extends StatelessWidget {
  const ProductDetailSizeSection({
    super.key,
    required this.product,
    required this.selectedSize,
  });

  final Product product;
  final ValueNotifier<int> selectedSize;

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      label: StringRes.kSize,
      child: Row(
        children: product.sizes
            .map(
              (e) => Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                ),
                child: GestureDetector(
                  onTap: () => selectedSize.value = e,
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: selectedSize.value == e ? context.onPrimary : null,
                      border: Border.all(
                        color: context.outlinedColor,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        e.toString(),
                        style: context.labelLarge?.copyWith(
                          color: selectedSize.value == e
                              ? context.primary
                              : context.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

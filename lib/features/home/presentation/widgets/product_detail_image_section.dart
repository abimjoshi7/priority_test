import 'package:flutter/material.dart';
import 'package:test_project/core/core.dart';
import 'package:test_project/features/features.dart';
import 'package:test_project/widgets/widgets.dart';

class ProductDetailImageSection extends StatelessWidget {
  const ProductDetailImageSection({
    super.key,
    required this.product,
    required this.selectedColor,
  });

  final Product product;
  final ValueNotifier<ShoeColor> selectedColor;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: context.height * 0.39,
      width: context.width,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Image.asset(
                product.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(
                    3,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 2,
                      ),
                      child: Icon(
                        Icons.circle,
                        size: 8,
                        color: index != 0 ? context.onContainerColor : null,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      16,
                    ),
                    color: context.primary,
                  ),
                  child: Row(
                    children: product.colors
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 4),
                            child: GestureDetector(
                              onTap: () => selectedColor.value =
                                  ShoeColor.values.elementAt(e - 1),
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  border: e == ShoeColor.White.colorType
                                      ? Border.all(color: context.outlinedColor)
                                      : null,
                                  shape: BoxShape.circle,
                                  color: ShoeColor.values
                                      .firstWhere(
                                          (element) => element.colorType == e)
                                      .color,
                                ),
                                child: e == selectedColor.value.colorType
                                    ? Icon(
                                        Icons.done,
                                        size: 10,
                                        color: e == ShoeColor.White.colorType
                                            ? context.onPrimary
                                            : context.primary,
                                      )
                                    : null,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

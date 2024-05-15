import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:test_project/core/enums/enums.dart';
import 'package:test_project/core/util/util.dart';
import 'package:test_project/features/features.dart';
import 'package:test_project/widgets/widgets.dart';


class ProductDetailPage extends HookWidget {
  const ProductDetailPage({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    final product = context.read<ProductCubit>().getProductById(id);
    final selectedColor = useState(ShoeColor.White);
    final selectedSize = useState<int>(
      product.sizes.first,
    );

    return Scaffold(
      appBar: AppBar(
        actions: const [
          CartBtn(),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    ProductDetailImageSection(
                        product: product, selectedColor: selectedColor),
                    ProductDetailTitleSection(
                        product: product, selectedSize: selectedSize),
                    ProductDetailSizeSection(
                        product: product, selectedSize: selectedSize),
                    ProductDetailDescriptionSection(product: product),
                    ProductDetailReviewSection(product: product),
                  ],
                ),
              ),
            ),
          ),
          Footer(
            
            leadingprice: product.price.toString(),
            onPressed: () => context.showBottomSheet(
              CartBottomSheet(
                product: product,
                color: selectedColor.value,
                size: selectedSize.value,
              ),
              canPop: false,
              showDragHandle: true,
            ),
          ),
        ],
      ),
    );
  }
}

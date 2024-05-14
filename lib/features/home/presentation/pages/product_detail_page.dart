import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

import 'package:test_project/enums.dart';
import 'package:test_project/features/cart/domain/domain.dart';
import 'package:test_project/features/home/presentation/presentation.dart';
import 'package:test_project/features/review/presentation/cubit/review_cubit.dart';
import 'package:test_project/res/res.dart';
import 'package:test_project/routes/routes.dart';
import 'package:test_project/util/util.dart';
import 'package:test_project/widgets/widgets.dart';

import '../../domain/entities/entities.dart';

class ProductDetailPage extends HookWidget {
  const ProductDetailPage({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    // useEffect(() {
    //   context.read<ProductCubit>().fetchProducts(id);
    //   return;
    // }, const []);
    final product = context.read<ProductCubit>().fetchProduct(id);
    final selectedColor = useState(ShoeColor.White);
    final selectedSize = useState<int?>(null);

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
              child: Column(
                children: [
                  CustomContainer(
                    height: context.height * 0.35,
                    width: context.width * 0.9,
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            product.image,
                            fit: BoxFit.cover,
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
                                      color: index != 0
                                          ? context.onContainerColor
                                          : null,
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
                                                ShoeColor.values
                                                    .elementAt(e - 1),
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                border: e ==
                                                        ShoeColor
                                                            .White.colorType
                                                    ? Border.all(
                                                        color: context
                                                            .outlinedColor)
                                                    : null,
                                                shape: BoxShape.circle,
                                                color: ShoeColor.values
                                                    .firstWhere((element) =>
                                                        element.colorType == e)
                                                    .color,
                                              ),
                                              child: e ==
                                                      selectedColor
                                                          .value.colorType
                                                  ? Icon(
                                                      Icons.done,
                                                      size: 10,
                                                      color: e ==
                                                              ShoeColor.White
                                                                  .colorType
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 24,
                    ),
                    child: Column(
                      children: [
                        Column(
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
                                  style: context.labelMedium?.copyWith(
                                      color: context.onContainerColor),
                                )
                              ],
                            )
                          ],
                        ),
                        CustomSection(
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
                                          color: selectedSize.value == e
                                              ? context.onPrimary
                                              : null,
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
                        ),
                        CustomSection(
                          label: StringRes.kDescription,
                          child: Text(product.description),
                        ),
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
                    ),
                  ),
                ],
              ),
            ),
          ),
          Footer(
            leadingprice: product.price.toString(),
            onPressed: () => context.showBottomSheet(
              CartBottomSheet(
                product: product,
                color: selectedColor.value,
                size: selectedSize.value ?? 44,
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

class CartBottomSheet extends HookWidget {
  const CartBottomSheet({
    super.key,
    required this.product,
    required this.size,
    required this.color,
  });

  final Product product;
  final int size;
  final ShoeColor color;

  @override
  Widget build(BuildContext context) {
    final qty = useTextEditingController();
    final cartItem = useState<CartItem?>(null);
    qty.addListener(
      () => cartItem.value = CartItem(
        product: product,
        color: color.name,
        colorType: color.colorType,
        quantity: int.tryParse(qty.text) ?? 0,
        size: size,
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringRes.kAddToCart,
                style: context.headlineMedium,
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.clear,
                ),
              ),
            ],
          ),
          TextField(
            controller: qty,
            autofocus: true,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: InputDecoration(
              labelText: StringRes.kQuantity,
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      if (qty.text.isEmpty || int.parse(qty.text) < 2) return;
                      qty.text = (int.parse(qty.text) - 1).toString();
                    },
                    icon: Icon(
                      Icons.remove_circle_outline_outlined,
                      color: context.outlinedColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () =>
                        qty.text = (int.parse(qty.text) + 1).toString(),
                    icon: const Icon(
                      Icons.add_circle_outline_rounded,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        StringRes.kTotalPrice,
                      ),
                    ),
                    Text(
                      "\$${product.price}",
                      style: context.headlineSmall,
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () => print(cartItem.value),
                  // Navigator.pushNamed(
                  //   context,
                  //   RouteRes.kCartPage,
                  // ),
                  child: const Text(
                    StringRes.kAddToCart,
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

class CustomSection extends StatelessWidget {
  const CustomSection({
    super.key,
    this.label,
    required this.child,
  });

  final String? label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Text(
              label!,
              style: context.titleLarge,
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: child,
          ),
        ],
      ),
    );
  }
}

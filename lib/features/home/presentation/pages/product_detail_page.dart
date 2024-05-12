import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:test_project/enums.dart';
import 'package:test_project/features/home/presentation/presentation.dart';

import 'package:test_project/res/res.dart';
import 'package:test_project/routes/routes.dart';
import 'package:test_project/util/util.dart';
import 'package:test_project/widgets/widgets.dart';

class ProductDetailPage extends HookWidget {
  const ProductDetailPage({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    final product = context.read<ProductCubit>().fetchProduct(id);
    final selectedColor = useState(ShoeColor.White);

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
                            const Row(
                              children: [
                                Text("Stars"),
                                Text("Reviews"),
                              ],
                            )
                          ],
                        ),
                        CustomSection(
                          label: StringRes.kSize,
                          child: Row(
                            children: product.size
                                .map(
                                  (e) => CircleAvatar(
                                    child: Text(
                                      e.toString(),
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
                        CustomSection(
                          label: StringRes.kReviews,
                          child: Column(
                            children: List.generate(
                              3,
                              (index) => const ReviewTile(),
                            ),
                          ),
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
                              ),
                              child: const Text("SEE ALL REVIEW"),
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
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (context) => const CartBottomSheet(),
            ),
          ),
        ],
      ),
    );
  }
}

class CartBottomSheet extends HookWidget {
  const CartBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final qty = useTextEditingController();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              StringRes.kAddToCart,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.clear,
              ),
            ),
          ],
        ),
        TextField(
          controller: qty,
          decoration: InputDecoration(
            labelText: "Quantity",
            suffixIcon: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.remove_circle_outline_outlined,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_circle_outline_rounded,
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              children: [
                Text(
                  StringRes.kTotalPrice,
                ),
                Text("123")
              ],
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(
                context,
                RouteRes.kCartPage,
              ),
              child: const Text(
                StringRes.kAddToCart,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class ReviewTile extends StatelessWidget {
  const ReviewTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(),
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Name"), Text("time")],
          ),
          Text("stars"),
          Text("comments"),
        ],
      ),
    );
  }
}

class CustomSection extends StatelessWidget {
  const CustomSection({
    super.key,
    required this.label,
    required this.child,
  });

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
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

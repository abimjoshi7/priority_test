import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:test_project/res/res.dart';
import 'package:test_project/routes/routes.dart';
import 'package:test_project/util/util.dart';

import 'package:test_project/widgets/widgets.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomContainer(
                    height: context.height * 0.3,
                    width: context.width * 0.9,
                    child: Image.asset(
                      ImageRes.kProduct7,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "Product Title",
                      ),
                      Row(
                        children: [
                          Text("Stars"),
                          Text("Reviews"),
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text("Size"),
                      Text("List of sizes"),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Description"),
                      Text("List of sizes"),
                    ],
                  ),
                  CustomSection(
                    label: "Reviews",
                    child: Column(
                      children: List.generate(
                        3,
                        (index) => ReviewTile(),
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
                        child: Text("SEE ALL REVIEW"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Footer(
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (context) => CartBottomSheet(),
            ),
          ),
        ],
      ),
    );
  }
}

class CartBottomSheet extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final qty = useTextEditingController();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              StringRes.kAddToCart,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
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
                  icon: Icon(
                    Icons.remove_circle_outline_outlined,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
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
            Column(
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
              child: Text(
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
  @override
  Widget build(BuildContext context) {
    return ListTile(
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
    Key? key,
    required this.label,
    required this.child,
  }) : super(key: key);

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.titleLarge,
        ),
        child,
      ],
    );
  }
}

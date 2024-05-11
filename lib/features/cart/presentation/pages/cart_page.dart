import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:test_project/features/home/presentation/pages/home_page.dart';
import 'package:test_project/res/res.dart';
import 'package:test_project/routes/routes.dart';
import 'package:test_project/widgets/footer.dart';
import 'package:test_project/widgets/widgets.dart';

class CartPage extends HookWidget {
  const CartPage({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                ...products.map(
                  (e) => Row(
                    children: [
                      CustomContainer(
                        child: Image.asset(
                          ImageRes.kProduct1,
                        ),
                      ),
                      Column(
                        children: [
                          Text("name"),
                          Row(
                            children: [
                              Text("brand"),
                              Text("color"),
                              Text("size"),
                            ],
                          ),
                          Row(
                            children: [
                              Text("price"),
                              // IncDecBtn(number: number),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Footer(
            leadingLabel: StringRes.kGrandTotal,
            btnText: StringRes.kCheckOut.toUpperCase(),
            onPressed: () => Navigator.pushNamed(
              context,
              RouteRes.kOrderSummaryPage,
            ),
          ),
        ],
      ),
    );
  }
}

class IncDecBtn extends StatelessWidget {
  const IncDecBtn({
    Key? key,
    required this.number,
  }) : super(key: key);

  final ValueNotifier<int> number;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => number.value--,
          icon: Icon(
            Icons.remove_circle_outline,
          ),
        ),
        Text(
          number.value.toString(),
        ),
        IconButton(
          onPressed: () => number.value++,
          icon: Icon(
            Icons.add_circle_outline,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:test_project/features/home/presentation/pages/product_detail_page.dart';
import 'package:test_project/widgets/footer.dart';

class OrderSummaryPage extends StatelessWidget {
  const OrderSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Information",
                    ),
                    CustomSection(
                      label: "Payment Method",
                      child: Text(
                        "Credit Card",
                      ),
                    ),
                    Divider(),
                    CustomSection(
                      label: "Location",
                      child: Text(
                        "Location name",
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Order Detail",
                    ),
                    Column(
                      children: List.generate(
                        5,
                        (index) => OrderTile(),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text("Payment Detail"),
                    KeyValueTile(),
                  ],
                ),
              ],
            ),
          ),
          Footer(
            btnText: "PAYMENT",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class OrderTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final customDivider = Text(".");
    return Column(
      children: [
        Text("Item name"),
        Row(
          children: [
            Row(
              children: [
                Text("Brand"),
                customDivider,
                Text("Color"),
                customDivider,
                Text("Size"),
                customDivider,
                Text(
                  "Qty 1",
                )
              ],
            ),
            Text(
              "price",
            )
          ],
        ),
      ],
    );
  }
}

class KeyValueTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("SubTotal"),
        Text("\$0.00"),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import 'package:test_project/widgets/widgets.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Placeholder(),
          Spacer(),
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
          Spacer(),
          Column(
            children: [
              Text("Size"),
              Text("List of sizes"),
            ],
          ),
          Spacer(),
          Column(
            children: [
              Text("Description"),
              Text("List of sizes"),
            ],
          ),
          Spacer(),
          CustomSection(
            label: "Reviews",
            child: Column(
              children: List.generate(
                3,
                (index) => ReviewTile(),
              ),
            ),
          ),
          Spacer(),
          OutlinedButton(
            onPressed: () {},
            child: Text("SEE ALL REVIEW"),
          ),
          Spacer(
            flex: 2,
          ),
          Footer(
            onPressed: () {},
          ),
        ],
      ),
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
      children: [
        Text(label),
        child,
      ],
    );
  }
}

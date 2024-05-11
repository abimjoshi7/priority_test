import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:test_project/features/home/presentation/pages/product_detail_page.dart';

class ReviewPage extends HookWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController =
        useTabController(initialLength: ReviewNumbers.values.length);
    var data = "Reviews";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(data),
      ),
      body: Column(
        children: [
          TabBar(
            isScrollable: true,
            controller: tabController,
            tabs: ReviewNumbers.values
                .map(
                  (e) => Tab(
                    text: e.label,
                  ),
                )
                .toList(),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: List.generate(
                tabController.length,
                (index) => ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) => ReviewTile(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum ReviewNumbers {
  All("All"),
  Five("5 stars"),
  Four("4 stars"),
  Three("3 stars"),
  Two("2 stars"),
  One("1 star");

  final String label;
  const ReviewNumbers(this.label);
}

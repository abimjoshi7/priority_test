import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:test_project/features/home/presentation/pages/product_detail_page.dart';

class ReviewPage extends HookWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final tabController = useTabController(initialLength: 6);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Reviews"),
      ),
      body: Column(
        children: [
          TabBar(
            isScrollable: true,
            controller: tabController,
            tabs: List.generate(
              tabController.length,
              (index) => Tab(
                text: "Tab $index",
              ),
            ),
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

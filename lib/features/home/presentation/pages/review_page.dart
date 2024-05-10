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
        bottom: PreferredSize(
          preferredSize: Size(width, height * 0.2),
          child: TabBar(
            controller: tabController,
            tabs: List.generate(
              6,
              (index) => Tab(
                text: "Tab $index",
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) => ReviewTile(),
          )
        ],
      ),
    );
  }
}

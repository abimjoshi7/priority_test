import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:test_project/models/product.dart';
import 'package:test_project/widgets/custom_container.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final tabList = List<String>.from(
      ShoesBrands.values.map((e) => e.name).toList(),
    )..insert(0, "All");

    final tabController = useTabController(
      initialLength: tabList.length,
    );
    const kDiscover = 'Discover';
    var kFilter = "Filter";
    final products = <Product>[];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_bag,
                ),
              )
            ],
            bottom: PreferredSize(
              preferredSize: Size(
                width,
                height * 0.2,
              ),
              child: TabBar(
                controller: tabController,
                tabs: tabList
                    .map(
                      (e) => Tab(
                        text: e,
                      ),
                    )
                    .toList(),
              ),
            ),
            centerTitle: false,
            title: const Text(kDiscover),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: tabController,
              children: [
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) => ProductCard(
                    product: products[index],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton.icon(
        onPressed: () {},
        icon: CircleAvatar(),
        label: Text(
          kFilter,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product _product;

  ProductCard({required Product product}) : _product = product;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      header: CustomContainer(
        child: CircleAvatar(),
      ),
      child: Column(
        children: [
          Text("name"),
          Text("ratings"),
          Text("price"),
        ],
      ),
    );
  }
}

class Product {}

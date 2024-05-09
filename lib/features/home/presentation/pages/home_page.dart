import 'package:flutter/material.dart';

enum ShoesBrands {
  Nike,
  Jordan,
  Adidas,
  Reebok,
  Vans,
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    const data = 'Discover';
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
                tabs: [],
              ),
            ),
            centerTitle: false,
            title: const Text(data),
          ),
        ],
      ),
    );
  }
}

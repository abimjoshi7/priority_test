import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:test_project/enums.dart';
import 'package:test_project/res/res.dart';
import 'package:test_project/style/style.dart';
import 'package:test_project/util/util.dart';
import 'package:test_project/widgets/custom_container.dart';
import 'package:test_project/widgets/widgets.dart';

import '../../domain/domain.dart';
import '../presentation.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabList = List<String>.from(
      ShoesBrands.values.map((e) => e.name).toList(),
    )..insert(0, "All");

    final tabController = useTabController(
      initialLength: tabList.length,
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(
            context,
            tabController,
            tabList,
          ),
          _buildProducts(tabController),
        ],
      ),
      floatingActionButton: const FliterBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildProducts(TabController tabController) {
    return SliverFillRemaining(
      child: TabBarView(
        controller: tabController,
        children: List.generate(
          tabController.length,
          (index) => ProductsGridView(index),
        ),
      ),
    );
  }

  SliverAppBar _buildAppBar(
      BuildContext context, TabController tabController, List<String> tabList) {
    return SliverAppBar(
      actions: const [
        CartBtn(),
      ],
      bottom: _buildTabBar(
        context,
        tabController,
        tabList,
      ),
      centerTitle: false,
      title: _buildTitle(
        context,
      ),
    );
  }

  Padding _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        StringRes.kDiscover,
        style: context.displaySmall?.copyWith(
          fontWeight: FontWeight.w900,
          shadows: [
            const Shadow(
              color: AppPalette.kClrBlack,
              blurRadius: 1.0,
              offset: Offset(
                0.5,
                0.5,
              ),
            ),
            const Shadow(
              color: AppPalette.kClrSliver,
              blurRadius: 2.0,
              offset: Offset(
                .5,
                2.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSize _buildTabBar(
    BuildContext context,
    TabController tabController,
    List<String> tabList,
  ) {
    return PreferredSize(
      preferredSize: Size(
        context.width,
        context.height * 0.1,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: TabBar(
          isScrollable: true,
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
    );
  }
}

class ProductCard extends StatelessWidget {
  // ignore: unused_field
  final Product _product;

  const ProductCard({super.key, required Product product}) : _product = product;

  @override
  Widget build(BuildContext context) {
    return const GridTile(
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

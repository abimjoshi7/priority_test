import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/models/product.dart';
import 'package:test_project/res/res.dart';
import 'package:test_project/routes/routes.dart';
import 'package:test_project/style/style.dart';
import 'package:test_project/util/util.dart';
import 'package:test_project/widgets/custom_container.dart';
import 'package:test_project/widgets/widgets.dart';

import '../widgets/widgets.dart';

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
    final products = <Product>[];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(
            context,
            tabController,
            tabList,
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: tabController,
              children: List.generate(
                tabController.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        RouteRes.kProductDetailPage,
                      ),
                      child: GridTile(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: CustomContainer(
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 24,
                                            left: 16,
                                          ),
                                          child: SvgPicture.asset(
                                            DrawableRes.kLogoAdidas,
                                            colorFilter: ColorFilter.mode(
                                              AppPalette.kClrSliver,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Image.asset(
                                            ImageRes.kProduct7,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Text("product name"),
                            const Text("reviews"),
                            const Text("price"),
                          ],
                        ),
                      ),
                    ),
                    // ProductCard(
                    //   product: products[index],
                    // ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: const FliterBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
            Shadow(
              color: AppPalette.kClrBlack,
              blurRadius: 1.0,
              offset: const Offset(
                0.5,
                0.5,
              ),
            ),
            Shadow(
              color: AppPalette.kClrSliver,
              blurRadius: 2.0,
              offset: const Offset(
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
  final Product _product;

  ProductCard({required Product product}) : _product = product;

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

class Product {}

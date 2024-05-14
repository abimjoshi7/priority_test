import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/enums.dart';
import 'package:test_project/features/review/presentation/cubit/review_cubit.dart';
import 'package:test_project/res/res.dart';
import 'package:test_project/routes/routes.dart';
import 'package:test_project/util/util.dart';
import 'package:test_project/widgets/widgets.dart';

import '../../presentation.dart';

class ProductsGridView extends HookWidget {
  const ProductsGridView(
    this.indexNumber, {
    super.key,
  });

  final int indexNumber;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return state.maybeMap(
          failure: (value) {
            var s = "Something went wrong. Please try again.";
            return Center(
              child: Text(value.exception?.toString() ?? s),
            );
          },
          success: (value) {
            final productList = context.read<ProductCubit>().filterBrand(
                  indexNumber,
                );
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 8,
              ),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemCount: productList.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    RouteRes.kProductDetailPage,
                    arguments: productList[index].id,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 24,
                                        left: 16,
                                      ),
                                      child: SvgPicture.asset(
                                        ShoesBrands.values
                                            .firstWhere(
                                              (element) =>
                                                  element.brandType ==
                                                  productList[index].brandType,
                                            )
                                            .icon,
                                        colorFilter: ColorFilter.mode(
                                          context.onContainerColor,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Image.asset(
                                        productList[index].image,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(productList[index].name,
                            style: context.labelLarge),
                        Row(
                          children: [
                            SvgPicture.asset(DrawableRes.kIconStars),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                              ),
                              child: Text(
                                productList[index].avgRating.toStringAsFixed(1),
                                style: context.titleLarge,
                              ),
                            ),
                            BlocBuilder<ReviewCubit, ReviewState>(
                              builder: (context, state) {
                                return Text(
                                    "(${context.read<ReviewCubit>().getReviewCount(
                                          productList[index].id,
                                        )})");
                              },
                            ),
                          ],
                        ),
                        Text(
                          "\$${productList[index].price}",
                          style: context.headlineSmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          orElse: () => const CustomLoader(),
        );
      },
    );
  }
}

class CustomLoader extends StatelessWidget {
  const CustomLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: context.onPrimary,
      ),
    );
  }
}

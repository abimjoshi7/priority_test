import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/core/core.dart';
import 'package:test_project/features/features.dart';
import 'package:test_project/widgets/widgets.dart';

class CartListView extends StatelessWidget {
  const CartListView({
    super.key,
    required this.cartList,
    required this.tileHeight,
  });

  final List<CartItem> cartList;
  final double tileHeight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: cartList.length,
        itemBuilder: (context, index) => CustomSlidableTile(
          height: tileHeight,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            child: Row(
              children: [
                CustomContainer(
                  height: tileHeight,
                  width: context.width * 0.2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      context
                          .read<ProductCubit>()
                          .getProductById(cartList[index].productId)
                          .image,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            context
                                .read<ProductCubit>()
                                .getProductById(
                                    cartList[index].productId)
                                .name,
                            style: context.headlineSmall,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              context
                                      .read<ProductCubit>()
                                      .getProductById(
                                          cartList[index].productId)
                                      .brandName ??
                                  "",
                            ),
                            const CustomDotDivider(),
                            Text(cartList[index].color),
                            const CustomDotDivider(),
                            Text(
                              cartList[index].size.toString(),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$${context.read<ProductCubit>().getProductById(cartList[index].productId).price}",
                              style: context.titleLarge,
                            ),
                            IncDecBtn(
                              number: cartList[index].quantity,
                              onChanged: (value) => cartList[index] =
                                  cartList[index]
                                      .copyWith(quantity: value),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          onPressed: () => context.read<CartCubit>().removeFromCart(
                cartList[index],
              ),
        ),
      ),
    );
  }
}

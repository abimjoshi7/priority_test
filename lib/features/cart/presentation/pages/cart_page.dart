import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

import 'package:test_project/features/cart/domain/domain.dart';
import 'package:test_project/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:test_project/features/home/presentation/cubit/cubit.dart';
import 'package:test_project/res/res.dart';
import 'package:test_project/routes/routes.dart';
import 'package:test_project/util/util.dart';
import 'package:test_project/widgets/custom_slidable_tile.dart';
import 'package:test_project/widgets/widgets.dart';

import '../../../home/domain/domain.dart';

class CartPage extends HookWidget {
  const CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final tileHeight = context.height * 0.12;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(StringRes.kCart),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final cartList = List<CartItem>.from(state.maybeMap(
            success: (value) => value.cartItems,
            orElse: () => <CartItem>[],
          ));
          return Column(
            children: [
              Expanded(
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
                                      SizedBox(
                                        width: 8,
                                        child: Center(child: Text(".")),
                                      ),
                                      Text(cartList[index].color),
                                      SizedBox(
                                        width: 8,
                                        child: Center(child: Text(".")),
                                      ),
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
              ),
              Footer(
                leadingLabel: StringRes.kGrandTotal,
                leadingprice: cartList.isNotEmpty
                    ? cartList
                        .map((e) => e.total)
                        .reduce((a, b) => a + b)
                        .toString()
                    : "0",
                btnText: StringRes.kCheckOut.toUpperCase(),
                onPressed: () => Navigator.pushNamed(
                  context,
                  RouteRes.kOrderSummaryPage,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class IncDecBtn extends HookWidget {
  const IncDecBtn({
    super.key,
    required this.number,
    required this.onChanged,
  });

  final int number;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final numberState = useState(number);

    return Row(
      children: [
        IconButton(
          onPressed: () {
            numberState.value--;
            onChanged(numberState.value);
          },
          icon: Icon(
            Icons.remove_circle_outline_outlined,
            color: context.outlinedColor,
          ),
        ),
        Text(
          numberState.value.toString(),
          style: context.titleLarge,
        ),
        IconButton(
          onPressed: () {
            numberState.value++;
            onChanged(numberState.value);
          },
          icon: const Icon(
            Icons.add_circle_outline_rounded,
          ),
        ),
      ],
    );
  }
}

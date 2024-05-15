import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:test_project/features/features.dart';
import 'package:test_project/core/res/res.dart';
import 'package:test_project/core/util/util.dart';

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
              CartListView(cartList: cartList, tileHeight: tileHeight),
              CartFooterSection(cartList: cartList),
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/features/cart/domain/entities/cart_item.dart';
import 'package:test_project/features/features.dart';
import 'package:test_project/util/util.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({
    super.key,
    required this.cartItem,
  });

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.read<ProductCubit>().getProductById(cartItem.productId).name,
          style: context.titleLarge,
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(cartItem.brandName),
                const CustomDotDivider(),
                Text(cartItem.color),
                const CustomDotDivider(),
                Text(cartItem.size.toString()),
                const CustomDotDivider(),
                Text(
                  "Qty ${cartItem.quantity}",
                )
              ],
            ),
            Text(
              "\$${cartItem.total}",
              style: context.titleLarge,
            )
          ],
        ),
      ],
    );
  }
}

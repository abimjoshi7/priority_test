import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/core/core.dart';
import 'package:test_project/features/features.dart';
import 'package:test_project/widgets/widgets.dart';

class CartBtmSheetFooterSection extends StatelessWidget {
  const CartBtmSheetFooterSection({
    super.key,
    required this.product,
    required this.cartItem,
    required this.qty,
  });

  final Product product;
  final ValueNotifier<CartItem?> cartItem;
  final TextEditingController qty;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  StringRes.kTotalPrice,
                ),
              ),
              Text(
                "\$${product.price}",
                style: context.headlineSmall,
              )
            ],
          ),
          BlocListener<CartCubit, CartState>(
            listener: (context, state) {
              state.mapOrNull(
                success: (value) => context.showBottomSheet(
                  SuccessSheet(
                    info:
                        "${context.read<CartCubit>().getCartCount()} Item Total",
                    label: "Added to cart",
                    left: OutlinedButton(
                      onPressed: () => Navigator.pushNamedAndRemoveUntil(
                        context,
                        RouteRes.kHomePage,
                        (route) => false,
                      ),
                      child: const Text(
                        "Back explore",
                      ),
                    ),
                    right: ElevatedButton(
                      onPressed: () => Navigator.pushNamedAndRemoveUntil(
                        context,
                        RouteRes.kCartPage,
                        (route) => route.isFirst,
                      ),
                      child: const Text(
                        "To cart",
                      ),
                    ),
                  ),
                ),
              );
            },
            child: ElevatedButton(
              onPressed: cartItem.value == null
                  ? () {}
                  : () => qty.text.isEmpty
                      ? context.showSnackBar(
                          isSuccessful: false,
                          StringRes.kQtyCantBeEmpty,
                        )
                      : context.read<CartCubit>().addToCart(cartItem.value!),
              child: const Text(
                StringRes.kAddToCart,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

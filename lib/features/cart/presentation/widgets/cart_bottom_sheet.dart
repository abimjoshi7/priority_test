import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:test_project/core/core.dart';
import 'package:test_project/features/features.dart';

class CartBottomSheet extends HookWidget {
  const CartBottomSheet({
    super.key,
    required this.product,
    required this.size,
    required this.color,
  });

  final Product product;
  final int size;
  final ShoeColor color;

  @override
  Widget build(BuildContext context) {
    final qty = useTextEditingController();
    final cartItem = useState<CartItem?>(null);
    qty.addListener(
      () => cartItem.value = CartItem(
        cartId: int.parse("${product.id}${color.colorType}$size"),
        productId: product.id,
        color: color.name,
        colorType: color.colorType,
        quantity: int.tryParse(qty.text) ?? 0,
        size: size,
        total: (int.tryParse(qty.text) ?? 0) *
            context.read<ProductCubit>().getProductById(product.id).price,
        brandName: product.brandName ?? "",
        image: product.image,
        price: product.price,
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringRes.kAddToCart,
                style: context.headlineMedium,
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.clear,
                ),
              ),
            ],
          ),
          TextField(
            controller: qty,
            autofocus: true,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: InputDecoration(
              labelText: StringRes.kQuantity,
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      if (qty.text.isEmpty || int.parse(qty.text) < 2) return;
                      qty.text = (int.parse(qty.text) - 1).toString();
                    },
                    icon: Icon(
                      Icons.remove_circle_outline_outlined,
                      color: context.outlinedColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (qty.text.isEmpty) return;
                      qty.text = (int.parse(qty.text) + 1).toString();
                    },
                    icon: const Icon(
                      Icons.add_circle_outline_rounded,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CartBtmSheetFooterSection(
            product: product,
            cartItem: cartItem,
            qty: qty,
          )
        ],
      ),
    );
  }
}

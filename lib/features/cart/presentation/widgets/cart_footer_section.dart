import 'package:flutter/material.dart';
import 'package:test_project/core/core.dart';
import 'package:test_project/features/features.dart';
import 'package:test_project/widgets/widgets.dart';

class CartFooterSection extends StatelessWidget {
  const CartFooterSection({
    super.key,
    required this.cartList,
  });

  final List<CartItem> cartList;

  @override
  Widget build(BuildContext context) {
    return Footer(
      leadingLabel: StringRes.kGrandTotal,
      leadingprice: cartList.isNotEmpty
          ? cartList.map((e) => e.total).reduce((a, b) => a + b).toString()
          : "0",
      btnText: StringRes.kCheckOut.toUpperCase(),
      onPressed: () => cartList.isNotEmpty
          ? Navigator.pushNamed(
              context,
              RouteRes.kOrderSummaryPage,
            )
          : context
              .showSnackBar("Add items to cart in order to proceed further."),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/res/res.dart';
import 'package:test_project/routes/routes.dart';

class CartBtn extends StatelessWidget {
  const CartBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      onPressed: () => Navigator.pushNamed(
        context,
        RouteRes.kCartPage,
      ),
      icon: SvgPicture.asset(
        DrawableRes.kIconBag,
      ),
    );
  }
}

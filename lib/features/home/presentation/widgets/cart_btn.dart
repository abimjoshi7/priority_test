import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/features/cart/presentation/cubit/cart_cubit.dart';
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
      icon: Badge(
        isLabelVisible: context.read<CartCubit>().getCartList().isNotEmpty,
        child: SvgPicture.asset(
          DrawableRes.kIconBag,
        ),
      ),
    );
  }
}

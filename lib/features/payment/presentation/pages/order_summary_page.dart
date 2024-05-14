import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:test_project/enums.dart';

import 'package:test_project/features/cart/domain/domain.dart';
import 'package:test_project/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:test_project/features/features.dart';
import 'package:test_project/features/payment/presentation/cubit/order_cubit.dart';
import 'package:test_project/res/res.dart';
import 'package:test_project/util/util.dart';
import 'package:test_project/widgets/footer.dart';

import '../../domain/domain.dart';
import '../widgets/widgets.dart';

class OrderSummaryPage extends HookWidget {
  const OrderSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final finalPrice = useState<double>(0);
    final paymentMethod = useState<PaymentMethod>(PaymentMethod.Card);
    final location = useState<Location>(Location.Tokyo);
    final shippingRate = useState<double>(0.05);

    return Scaffold(
      appBar: AppBar(
        title: const Text(StringRes.kOrderSummary),
        centerTitle: true,
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final cartList = state.maybeMap(
            success: (value) => value.cartItems,
            orElse: () => <CartItem>[],
          );

          final subtotal = context.read<OrderCubit>().getSubtotal(cartList);
          final shippingCharge = context
              .read<OrderCubit>()
              .getShippingCharge(subtotal, shippingRate.value);
          final total = context
              .read<OrderCubit>()
              .getFinalTotal(cartList, shippingCharge);

          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              StringRes.kInformation,
                              style: context.headlineMedium,
                            ),
                          ),
                          ListTile(
                            onTap: () => context.showBottomSheet(
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: PaymentMethod.values
                                    .map(
                                      (e) => RadioListTile.adaptive(
                                        value: e,
                                        groupValue: paymentMethod.value,
                                        onChanged: (value) {
                                          paymentMethod.value = value!;
                                          Navigator.pop(context);
                                        },
                                        activeColor: context.onPrimary,
                                        title: Text(e.label),
                                      ),
                                    )
                                    .toList(),
                              ),
                              showDragHandle: true,
                            ),
                            minVerticalPadding: 0,
                            contentPadding: EdgeInsets.zero,
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomSection(
                                  label: StringRes.kPaymentMethod,
                                  child: Row(
                                    children: [
                                      Text(
                                        paymentMethod.value.label,
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 16,
                                  color: context.outlinedColor,
                                )
                              ],
                            ),
                          ),
                          Divider(
                            color: context.outlinedColor,
                          ),
                          ListTile(
                            onTap: () => context.showBottomSheet(
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: Location.values
                                    .map(
                                      (e) => RadioListTile.adaptive(
                                        value: e,
                                        groupValue: location.value,
                                        onChanged: (value) {
                                          location.value = value!;
                                          Navigator.pop(context);
                                        },
                                        activeColor: context.onPrimary,
                                        title: Text(e.label),
                                      ),
                                    )
                                    .toList(),
                              ),
                              showDragHandle: true,
                            ),
                            minVerticalPadding: 0,
                            contentPadding: EdgeInsets.zero,
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomSection(
                                  label: StringRes.kLocation,
                                  child: Text(
                                    location.value.label,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 16,
                                  color: context.outlinedColor,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringRes.kOrderDetail,
                              style: context.headlineMedium,
                            ),
                            cartList.isEmpty
                                ? const EmptyWidget()
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Column(
                                      children: List.generate(
                                        cartList.length,
                                        (index) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4),
                                          child: OrderTile(
                                            cartItem: cartList[index],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringRes.kPaymentDetail,
                              style: context.headlineMedium,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(StringRes.kSubTotal),
                                        Text(
                                          "\$${subtotal.toStringAsFixed(2)}",
                                          style: context.titleLarge,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(StringRes.kShippingCharge),
                                      Text(
                                        "\$${shippingCharge.toStringAsFixed(2)}",
                                        style: context.titleLarge,
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: context.outlinedColor,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(StringRes.kTotal),
                                      Text(
                                        "\$${total.toStringAsFixed(2)}",
                                        style: context.titleLarge,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Footer(
                btnText: StringRes.kPayment,
                leadingprice: total.toStringAsFixed(2),
                onPressed: () {
                  final orderItem = OrderItem(
                    orderId: UniqueKey()
                        .toString()
                        .replaceAll('[', '')
                        .replaceAll(']', ''),
                    cartItems: cartList,
                    paymentMethod: paymentMethod.value.label,
                    location: location.value.label,
                    additionalCharges: shippingCharge,
                    totalOrderPrice: total,
                  );
                  print(orderItem);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

// class KeyValueTile extends HookWidget {
//   const KeyValueTile({
//     super.key,
//     required this.cartList,
//     required this.finalPrice,
//   });

//   final List<CartItem> cartList;
//   final ValueNotifier<double> finalPrice;

//   @override
//   Widget build(BuildContext context) {
//     final subTotal = cartList
//         .map((e) => e.total)
//         .reduce((value, element) => value + element);
//     final shippingRate = useState<double>(0.05);
//     final shippingCharges = subTotal * shippingRate.value;
//     final total = subTotal + shippingCharges;

//     // finalPrice.value = total;

//     return;
//   }
// }

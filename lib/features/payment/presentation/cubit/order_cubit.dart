import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:test_project/features/cart/domain/entities/cart_item.dart';
import 'package:test_project/features/payment/domain/domain.dart';

part 'order_cubit.freezed.dart';
part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(
    this.addOrderItem,
    this.getOrderItems,
  ) : super(const OrderState.initial());

  final AddOrderItem addOrderItem;
  final GetOrderItems getOrderItems;

  double getSubtotal(List<CartItem> cartList) {
    if (cartList.isEmpty) return 0;
    return cartList
        .map((e) => e.price * e.quantity)
        .reduce((value, element) => value + element);
  }

  double getShippingCharge(double subtotal, double rate) {
    return subtotal * rate;
  }

  double getFinalTotal(List<CartItem> cartItems, double shippingCharge) {
    if (cartItems.isEmpty) return 0;
    final subtotal = cartItems
        .map((e) => e.total)
        .reduce((value, element) => value + element);
    return subtotal + shippingCharge;
  }

  Future<void> createOrder(OrderItem order) async {
    try {
      emit(const OrderState.loading());
      await addOrderItem.call(order).then(
            (value) => switch (value) {
              Right<Exception, int>() => fetchOrders(),
              Left<Exception, int>(:final value) => emit(OrderState.failure(
                  value,
                ))
            },
          );
    } catch (e) {
      emit(
        OrderState.failure(
          Exception(e.toString()),
        ),
      );
    }
  }

  Future<void> fetchOrders() async {
    try {
      emit(const OrderState.loading());
      await getOrderItems.call(unit).then(
            (value) => switch (value) {
              Right<Exception, List<OrderItem>>(:final value) => emit(
                  OrderState.success(
                    value,
                  ),
                ),
              Left<Exception, List<OrderItem>>(:final value) => emit(
                  OrderState.failure(
                    value,
                  ),
                ),
            },
          );
    } catch (e) {
      emit(
        OrderState.failure(
          Exception(e.toString()),
        ),
      );
    }
  }
}

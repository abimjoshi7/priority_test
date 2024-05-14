import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../domain/domain.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState> with HydratedMixin {
  CartCubit() : super(const CartState.initial());

  List<CartItem> getCartList() {
    return state.maybeMap(
      success: (value) => value.cartItems,
      orElse: () => [],
    );
  }

  void addToCart(CartItem item) {
    try {
      // emit(const CartState.loading());
      var existingList = List<CartItem>.from(getCartList());
      var index =
          existingList.indexWhere((element) => element.cartId == item.cartId);
      if (index != -1) {
        existingList[index] = item.copyWith(
          quantity: existingList[index].quantity + item.quantity,
        );
      } else {
        existingList = List<CartItem>.from(existingList)..add(item);
      }
      emit(
        CartState.success(
          cartItems: existingList,
        ),
      );
    } catch (e) {
      emit(
        CartState.failure(
          Exception(
            e.toString(),
          ),
        ),
      );
    }
  }

  void removeFromCart(CartItem item) {
    try {
      emit(const CartState.loading());
      var newList = List<CartItem>.from(getCartList())..remove(item);
      emit(CartState.success(cartItems: newList));
    } catch (e) {
      emit(
        CartState.failure(
          Exception(
            e.toString(),
          ),
        ),
      );
    }
  }

  int getCartCount() {
    return getCartList().length;
  }

  double getGrandTotal(int quantity, double price) {
    return price * quantity;
  }

  void clearCartItems() {
    emit(
      const CartState.initial(),
    );
  }

  @override
  CartState? fromJson(Map<String, dynamic> json) {
    try {
      final response = json.values.map((e) => CartItem.fromJson(e)).toList();
      if (response.isEmpty) return null;
      return CartState.success(
        cartItems: response,
      );
    } catch (e) {
      throw e.toString();
    }
  }

  // final response = json.values.map((e) => CartItem.fromJson(e)).toList();
  // if (response.isNotEmpty) {
  //   return CartState.success(
  //     cartItems: response,
  //   );
  // } else {
  // }
  //   return null;
  // }

  @override
  Map<String, dynamic>? toJson(CartState state) {
    try {
      final cartItems = state.mapOrNull(
        success: (value) => value.cartItems,
      );

      if (cartItems == null) return null;
      return cartItems.asMap().map(
            (key, value) => MapEntry(
              key.toString(),
              value.toJson(),
            ),
          );
    } catch (e) {
      throw e.toString();
    }
  }
}

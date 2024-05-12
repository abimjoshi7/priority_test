import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/domain.dart';

part 'product_cubit.freezed.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({
    required this.addProduct,
    required this.getProducts,
  }) : super(const ProductState.initial());

  final AddProduct addProduct;
  final GetProducts getProducts;

  Future<void> insertProduct(Product product) async {
    emit(
      const ProductState.loading(),
    );
    return addProduct.call(product).then(
          (value) => switch (value) {
            Right<Exception, int>() => fetchProducts(),
            Left<Exception, int>(:final value) => emit(
                ProductState.failure(
                  value,
                ),
              ),
          },
        );
  }

  Future<void> fetchProducts() async {
    emit(
      const ProductState.loading(),
    );
    return getProducts.call(unit).then(
          (value) => switch (value) {
            Right<Exception, List<Product>>(:final value) => emit(
                ProductState.success(
                  value,
                ),
              ),
            Left<Exception, List<Product>>(:final value) => emit(
                ProductState.failure(
                  value,
                ),
              ),
          },
        );
  }

  List<Product> getProductList() {
    return state.maybeMap(
      success: (value) => value.products,
      orElse: () => [],
    );
  }

  Product fetchProduct(int id) {
    final products = getProductList();
    return products.firstWhere((element) => element.id == id);
  }

  void filterBrand(int index) async {
    try {
      await fetchProducts();
      if (index != 0) {
        var newList = getProductList()
            .where((element) => element.brandType == index)
            .toList();
        emit(
          ProductState.success(
            newList,
          ),
        );
      }
    } catch (e) {
      emit(
        ProductState.failure(
          Exception(e.toString()),
        ),
      );
    }
  }

  Future<int> getItemCount([int? brandType]) async => fetchProducts().then(
        (_) {
          final list = getProductList()
              .where((element) =>
                  brandType == null ? true : element.brandType == brandType)
              .toList();
          return list.length;
        },
      );
}

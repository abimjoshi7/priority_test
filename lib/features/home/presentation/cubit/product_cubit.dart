import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test_project/di.dart';

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
    final updateProduct = await getAvgReview(product.id).then(
      (value) => product = product.copyWith(
        avgRating: value.toDouble(),
      ),
    );
    return addProduct.call(updateProduct).then(
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

  Future<void> fetchProducts([
    int? productId,
  ]) async {
    emit(
      const ProductState.loading(),
    );
    return getProducts.call(unit).then(
          (value) => switch (value) {
            Right<Exception, List<Product>>(:final value) => emit(
                ProductState.success(
                  products: value,
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

  Product getProductById(int id) {
    try {
      final products = getProductList();
      return products.firstWhere((element) => element.id == id);
    } catch (e) {
      return Product.d();
    }
  }

  List<Product> filterBrand(int index) {
    try {
      getProductList();
      if (index != 0) {
        var newList = List<Product>.from(getProductList()
            .where((element) => element.brandType == index)
            .toList());
        return newList;
      } else {
        return getProductList();
      }
    } catch (e) {
      return [];
    }
  }

  int getItemCount([int? brandType]) {
    try {
      final newList = getProductList()
          .where((element) =>
              brandType == null ? true : element.brandType == brandType)
          .toList();
      return newList.length;
    } catch (e) {
      return 0;
    }
  }

  Future<num> getAvgReview(int productId) async {
    try {
      return await locator<SupabaseClient>().functions.invoke(
        "compute_average_review",
        method: HttpMethod.post,
        body: {
          "productId": productId,
        },
      ).then(
        (value) => value.data["data"] as num,
      );
    } catch (e) {
      return 0.0;
    }
  }
}

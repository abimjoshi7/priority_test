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
    try {
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
    } catch (e) {
      emit(
        ProductState.failure(
          Exception(
            e.toString(),
          ),
        ),
      );
    }
  }

  Future<void> fetchProducts([
    int? productId,
  ]) async {
    try {
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
    } catch (e) {
      emit(
        ProductState.failure(
          Exception(
            e.toString(),
          ),
        ),
      );
    }
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

  List<Product> filterBrand(
    int brandType, {
    double? startPrice,
    double? endPrice,
    bool? lowestPrice,
    bool? recentlyAdded,
    bool? highestReview,
    int? genderType,
    int? colorType,
  }) {
    try {
      getProductList();

      if (brandType != 0) {
        var newList = List<Product>.from(
          getProductList().where(
            (element) => element.brandType == brandType,
          ),
        ).toList();
        return newList;
      } else {
        return List<Product>.from(getProductList())
            .where(
              (element) => (startPrice != null && endPrice != null)
                  ? element.price >= startPrice && element.price <= endPrice
                  : startPrice != null
                      ? element.price >= startPrice
                      : endPrice != null
                          ? element.price <= endPrice
                          : true,
            )
            .where(
              (element) => genderType != null
                  ? element.genderType == genderType
                  : colorType != null
                      ? element.colors.contains(colorType)
                      : true,
            )
            .toList()
          ..sort(
            (a, b) => highestReview == true
                ? b.avgRating.compareTo(a.avgRating)
                : lowestPrice == true
                    ? a.price.compareTo(b.price)
                    : recentlyAdded == true
                        ? b.addedDate.compareTo(a.addedDate)
                        : 0,
          );
        // ..where(
        //   (element) => startPrice != null
        //       ? element.price >= startPrice
        //       : endPrice != null
        //           ? element.price <= endPrice
        //           : true,
        // );
        //   .where(
        //     (element) => genderType != null
        //         ? element.genderType == genderType
        //         : colorType != null
        //             ? element.colors.contains(colorType)
        //             : true,
        //   )
        //   .toList()
        // ..sort(
        //   (a, b) => highestReview == true
        //       ? b.avgRating.compareTo(a.avgRating)
        //       : lowestPrice == true
        //           ? a.price.compareTo(b.price)
        //           : recentlyAdded == true
        //               ? b.addedDate.compareTo(a.addedDate)
        //               : 0,
        // );
      }
    } catch (e) {
      return [];
    }
  }

  Product getExpensiveProduct() {
    final products = getProductList();
    if (products.isEmpty) return Product.d();
    return products
        .reduce((curr, next) => curr.price > next.price ? curr : next);
  }

  Product getCheapestProduct() {
    final products = getProductList();
    if (products.isEmpty) return Product.d();
    return products
        .reduce((curr, next) => curr.price < next.price ? curr : next);
  }

  int getItemCount([String? brandName]) {
    try {
      final newList = getProductList()
          .where((element) =>
              brandName == null ? true : element.brandName == brandName)
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

  //  List<Product> _filterProducts(List<Product> products, RangeValues range) {
  //   return products.where((product) {
  //     return product.price >= range.start && product.price <= range.end;
  //   }).toList();
  // }
}

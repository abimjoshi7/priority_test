import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:test_project/features/home/data/data.dart';
import 'package:test_project/features/home/presentation/cubit/product_cubit.dart';

import 'features/home/domain/domain.dart';

final locator = GetIt.instance;

init() => locator
  ..registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance)
  ..registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      locator<FirebaseFirestore>(),
    ),
  )
  ..registerLazySingleton<GetProducts>(
    () => GetProducts(
      locator<ProductRepository>(),
    ),
  )
  ..registerLazySingleton<AddProduct>(
    () => AddProduct(
      locator<ProductRepository>(),
    ),
  )
  ..registerFactory(
    () => ProductCubit(
      addProduct: locator<AddProduct>(),
      getProducts: locator<GetProducts>(),
    ),
  );

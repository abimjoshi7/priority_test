import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:test_project/features/home/data/data.dart';
import 'package:test_project/features/home/presentation/cubit/product_cubit.dart';
import 'package:test_project/features/review/data/repository/repository.dart';

import 'features/home/domain/domain.dart';
import 'features/review/domain/domain.dart';
import 'features/review/presentation/cubit/review_cubit.dart';

final locator = GetIt.instance;

init() => locator
  ..registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance)
  ..registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      locator<FirebaseFirestore>(),
    ),
  )
  ..registerLazySingleton<ReviewRepository>(
    () => ReviewRepositoryImpl(
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
  ..registerLazySingleton<GetReviews>(
    () => GetReviews(
      locator<ReviewRepository>(),
    ),
  )
  ..registerLazySingleton<AddReview>(
    () => AddReview(
      locator<ReviewRepository>(),
    ),
  )
  ..registerFactory(
    () => ProductCubit(
      addProduct: locator<AddProduct>(),
      getProducts: locator<GetProducts>(),
    ),
  )
  ..registerFactory(
    () => ReviewCubit(
      locator<AddReview>(),
      locator<GetReviews>(),
    ),
  );

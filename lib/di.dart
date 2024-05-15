import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test_project/features/features.dart';

final locator = GetIt.instance;

init() => locator
  ..registerSingleton<SupabaseClient>(Supabase.instance.client)
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
  ..registerLazySingleton<OrderItemRepository>(
    () => OrderItemRepositoryImpl(
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
  ..registerLazySingleton<GetOrderItems>(
    () => GetOrderItems(
      locator<OrderItemRepository>(),
    ),
  )
  ..registerLazySingleton<AddOrderItem>(
    () => AddOrderItem(
      locator<OrderItemRepository>(),
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
  )
  ..registerFactory(
    () => CartCubit(),
  )
  ..registerFactory(
    () => OrderCubit(
      locator<AddOrderItem>(),
      locator<GetOrderItems>(),
    ),
  )
  ..registerFactory(
    () => FilterCubit(
    ),
  )
  ;

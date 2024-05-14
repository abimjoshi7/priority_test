import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:test_project/features/home/domain/domain.dart';

class ProductRepositoryImpl implements ProductRepository {
  final FirebaseFirestore _firestore;

  ProductRepositoryImpl(this._firestore);

  @override
  Future<Either<Exception, int>> addT(Product t) async {
    try {
      await _firestore.collection('products').add(
            t.toJson(),
          );
      return right(
        HttpStatus.ok,
      );
    } catch (e) {
      return left(
        Exception(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Exception, int>> deleteT(int id) {
    // TODO: implement deleteT
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, Product>> getT(int id) {
    // TODO: implement getT
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, List<Product>>> getTs() async {
    try {
      final result = await _firestore.collection("products").get();
      return right(
        result.docs.map((e) => Product.fromJson(e.data())).toList(),
      );
    } catch (e) {
      return left(
        Exception(
          e.toString(),
        ),
      );
    }
  }
}

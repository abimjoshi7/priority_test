import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:test_project/features/features.dart';

import '../../domain/domain.dart';

class OrderItemRepositoryImpl implements OrderItemRepository {
  final FirebaseFirestore _firestore;

  OrderItemRepositoryImpl(this._firestore);
  @override
  Future<Either<Exception, int>> addT(OrderItem t) async {
    try {
      await _firestore.collection('orders').add(
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
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, OrderItem>> getT(int id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, List<OrderItem>>> getTs() async {
    try {
      final result = await _firestore.collection("orders").get();
      return right(
        result.docs.map((e) => OrderItem.fromJson(e.data())).toList(),
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

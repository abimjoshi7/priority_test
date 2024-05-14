import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/src/either.dart';

import '../../domain/domain.dart';

class OrderItemRepositoryImpl implements OrderItemRepository {
  final FirebaseFirestore firestore;

  OrderItemRepositoryImpl(this.firestore);
  @override
  Future<Either<Exception, int>> addT(OrderItem t) {
    // TODO: implement addT
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, int>> deleteT(int id) {
    // TODO: implement deleteT
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, OrderItem>> getT(int id) {
    // TODO: implement getT
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, List<OrderItem>>> getTs() {
    // TODO: implement getTs
    throw UnimplementedError();
  }
}

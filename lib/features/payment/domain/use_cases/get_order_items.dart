import 'package:fpdart/fpdart.dart';
import 'package:test_project/generics/use_case.dart';

import '../domain.dart';

class GetOrderItems extends UseCase<List<OrderItem>, Unit> {
  final OrderItemRepository repository;

  GetOrderItems(this.repository);

  @override
  Future<Either<Exception, List<OrderItem>>> call(Unit p) async =>
      repository.getTs();
}

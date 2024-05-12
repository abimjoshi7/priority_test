import 'package:fpdart/fpdart.dart';
import 'package:test_project/generics/use_case.dart';

import '../domain.dart';

class GetOrderItem extends UseCase<OrderItem, int> {
  final OrderItemRepository repository;

  GetOrderItem(this.repository);

  @override
  Future<Either<Exception, OrderItem>> call(int p) async => repository.getT(p);
}

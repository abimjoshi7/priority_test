import 'package:fpdart/fpdart.dart';
import 'package:test_project/generics/use_case.dart';

import '../domain.dart';

class AddOrderItem extends UseCase<int, OrderItem> {
  final OrderItemRepository repository;

  AddOrderItem(this.repository);

  @override
  Future<Either<Exception, int>> call(OrderItem p) async => repository.addT(p);
}

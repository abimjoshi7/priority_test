import 'package:fpdart/fpdart.dart';
import 'package:test_project/generics/use_case.dart';

import '../domain.dart';

class DeleteOrderItem extends UseCase<int, int> {
  final OrderItemRepository repository;

  DeleteOrderItem(this.repository);

  @override
  Future<Either<Exception, int>> call(int p) async => repository.deleteT(p);
}

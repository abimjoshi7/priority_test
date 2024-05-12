import 'package:fpdart/fpdart.dart';
import 'package:test_project/generics/use_case.dart';

import '../domain.dart';

class DeleteOrder extends UseCase<int, int> {
  final OrderRepository repository;

  DeleteOrder(this.repository);

  @override
  Future<Either<Exception, int>> call(int p) async => repository.deleteT(p);
}

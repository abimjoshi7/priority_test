import 'package:fpdart/fpdart.dart';
import 'package:test_project/generics/use_case.dart';

import '../domain.dart' as o;

class AddOrder extends UseCase<int, o.Order> {
  final o.OrderRepository repository;

  AddOrder(this.repository);

  @override
  Future<Either<Exception, int>> call(o.Order p) async => repository.addT(p);
}

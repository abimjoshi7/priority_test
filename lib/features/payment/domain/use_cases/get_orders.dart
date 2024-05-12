import 'package:fpdart/fpdart.dart';
import 'package:test_project/generics/use_case.dart';

import '../domain.dart' as o;

class GetOrders extends UseCase<List<o.Order>, Unit> {
  final o.OrderRepository repository;

  GetOrders(this.repository);

  @override
  Future<Either<Exception, List<o.Order>>> call(Unit p) async =>
      repository.getTs();
}

import 'package:fpdart/fpdart.dart';
import 'package:test_project/generics/use_case.dart';

import '../domain.dart' as o;

class GetOrder extends UseCase<o.Order, int> {
  final o.OrderRepository repository;

  GetOrder(this.repository);

  @override
  Future<Either<Exception, o.Order>> call(int p) async => repository.getT(p);
}

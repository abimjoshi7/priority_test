import 'package:fpdart/fpdart.dart';
import 'package:test_project/core/generics/use_case.dart';

import '../domain.dart';

class GetProduct extends UseCase<Product, int> {
  final ProductRepository repository;

  GetProduct(this.repository);

  @override
  Future<Either<Exception, Product>> call(int p) async => repository.getT(p);
}

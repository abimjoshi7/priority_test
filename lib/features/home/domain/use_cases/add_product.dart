import 'package:fpdart/fpdart.dart';
import 'package:test_project/core/generics/use_case.dart';

import '../domain.dart';

class AddProduct extends UseCase<int, Product> {
  final ProductRepository repository;

  AddProduct(this.repository);

  @override
  Future<Either<Exception, int>> call(Product p) async => repository.addT(p);
}

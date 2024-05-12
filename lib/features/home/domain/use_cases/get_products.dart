import 'package:fpdart/fpdart.dart';
import 'package:test_project/generics/use_case.dart';

import '../domain.dart';

class GetProducts extends UseCase<List<Product>, Unit> {
  final ProductRepository repository;

  GetProducts(this.repository);

  @override
  Future<Either<Exception, List<Product>>> call(Unit p) async =>
      repository.getTs();
}

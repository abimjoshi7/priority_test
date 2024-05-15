import 'package:fpdart/fpdart.dart';
import 'package:test_project/core/generics/use_case.dart';

import '../../../home/domain/domain.dart';

class DeleteProduct extends UseCase<int, int> {
  final ProductRepository repository;

  DeleteProduct(this.repository);

  @override
  Future<Either<Exception, int>> call(int p) async => repository.deleteT(p);
}

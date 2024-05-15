import 'package:fpdart/fpdart.dart';
import 'package:test_project/core/generics/use_case.dart';

import '../domain.dart';

class DeleteReview extends UseCase<int, int> {
  final ReviewRepository repository;

  DeleteReview(this.repository);

  @override
  Future<Either<Exception, int>> call(int p) async => repository.deleteT(p);
}

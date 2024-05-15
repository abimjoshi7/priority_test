import 'package:fpdart/fpdart.dart';
import 'package:test_project/core/generics/use_case.dart';

import '../domain.dart';

class GetReviews extends UseCase<List<Review>, Unit> {
  final ReviewRepository repository;

  GetReviews(this.repository);

  @override
  Future<Either<Exception, List<Review>>> call(Unit p) async =>
      repository.getTs();
}

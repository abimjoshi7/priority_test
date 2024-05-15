import 'package:fpdart/fpdart.dart';
import 'package:test_project/core/generics/use_case.dart';

import '../domain.dart';

class AddReview extends UseCase<int, Review> {
  final ReviewRepository repository;

  AddReview(this.repository);

  @override
  Future<Either<Exception, int>> call(Review p) async => repository.addT(p);
}

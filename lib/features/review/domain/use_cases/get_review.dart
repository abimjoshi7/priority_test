import 'package:fpdart/fpdart.dart';
import 'package:test_project/generics/use_case.dart';

import '../domain.dart';

class GetReview extends UseCase<Review, int> {
  final ReviewRepository repository;

  GetReview(this.repository);

  @override
  Future<Either<Exception, Review>> call(int p) async => repository.getT(p);
}

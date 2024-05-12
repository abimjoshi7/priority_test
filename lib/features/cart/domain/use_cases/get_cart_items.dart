import 'package:fpdart/fpdart.dart';
import 'package:test_project/features/cart/domain/domain.dart';
import 'package:test_project/generics/use_case.dart';

class GetCartItems extends UseCase<List<CartItem>, Unit> {
  final CartItemRepository repository;

  GetCartItems(this.repository);

  @override
  Future<Either<Exception, List<CartItem>>> call(Unit p) async =>
      repository.getTs();
}

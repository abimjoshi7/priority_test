import 'package:fpdart/fpdart.dart';
import 'package:test_project/generics/use_case.dart';

import '../domain.dart';

class GetCartItem extends UseCase<CartItem, int> {
  final CartItemRepository repository;

  GetCartItem(this.repository);

  @override
  Future<Either<Exception, CartItem>> call(int p) async => repository.getT(p);
}

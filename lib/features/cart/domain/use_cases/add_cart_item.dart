import 'package:fpdart/fpdart.dart';
import 'package:test_project/generics/use_case.dart';

import '../domain.dart';

class AddCartItem extends UseCase<int, CartItem> {
  final CartItemRepository repository;

  AddCartItem(this.repository);

  @override
  Future<Either<Exception, int>> call(CartItem p) async => repository.addT(p);
}

import 'package:fpdart/fpdart.dart';

abstract class BaseMethods<E extends Exception, T> {
  Future<Either<E, List<T>>> getTs();
  Future<Either<E, T>> getT(int id);
  Future<Either<E, int>> addT(T t);
  Future<Either<E, int>> deleteT(int id);
}

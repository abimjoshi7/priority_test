import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:test_project/features/review/domain/entities/review.dart';
import 'package:test_project/features/review/domain/repository/repository.dart';

class ReviewRepositoryImpl implements ReviewRepository {
  final FirebaseFirestore _firestore;

  ReviewRepositoryImpl(this._firestore);

  @override
  Future<Either<Exception, int>> addT(Review t) async {
    try {
      await _firestore.collection('reviews').add(t.toJson());
      return right(
        HttpStatus.ok,
      );
    } catch (e) {
      return left(
        Exception(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Exception, int>> deleteT(int id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, Review>> getT(int id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, List<Review>>> getTs() async {
    try {
      final result = await _firestore.collection("reviews").get();
      return right(
        result.docs.map((e) => Review.fromJson(e.data())).toList(),
      );
    } catch (e) {
      return left(
        Exception(
          e.toString(),
        ),
      );
    }
  }
}

import 'package:bookcleanarch_app/Features/home/domain/entites/book_entity.dart';
import 'package:bookcleanarch_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookEntity>>> fetchNewstBooks();
}

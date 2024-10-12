import 'package:bookcleanarch_app/Features/home/domain/entites/book_entity.dart';
import 'package:bookcleanarch_app/Features/home/domain/repos/home_repo.dart';
import 'package:bookcleanarch_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCse {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCse(this.homeRepo);
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() {
    return homeRepo.fetchFeaturedBooks();
  }
}

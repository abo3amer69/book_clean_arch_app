import 'package:bookcleanarch_app/Features/home/domain/entites/book_entity.dart';
import 'package:bookcleanarch_app/Features/home/domain/repos/home_repo.dart';
import 'package:bookcleanarch_app/core/errors/failure.dart';
import 'package:bookcleanarch_app/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCse extends UseCase<List<BookEntity>, NoParam> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCse(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) async {
    return await homeRepo.fetchFeaturedBooks();
  }
}

import 'package:bookcleanarch_app/Features/home/domain/entites/book_entity.dart';

abstract class HomeLocalDataSource {
List<BookEntity> fetchFeaturedBooks();
List<BookEntity> fetchNewestBooks();
}

class omeLocalDataSourceImpl extends HomeLocalDataSource{
  @override
  List<BookEntity> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }

}
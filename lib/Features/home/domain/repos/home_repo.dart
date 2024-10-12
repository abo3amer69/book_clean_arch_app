import 'package:bookcleanarch_app/Features/home/domain/entites/book_entity.dart';

abstract class HomeRepo{
    Future<List<BookEntity>>fetchFeaturedBooks();
    Future<List<BookEntity>>fetchNewstBooks();
}
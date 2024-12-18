import 'package:bookcleanarch_app/Features/home/data/model/book_model/book_model.dart';
import 'package:bookcleanarch_app/Features/home/domain/entites/book_entity.dart';
import 'package:bookcleanarch_app/constants.dart';
import 'package:bookcleanarch_app/core/utils/api_services.dart';
import 'package:bookcleanarch_app/core/utils/function/save_box.dart';
import 'package:hive/hive.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiServices;

  HomeRemoteDataSourceImpl(this.apiServices);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiServices.get(
        endPoint: 'volumes?q=programming&Filtering=free_ebooks');
    List<BookEntity> books = getBooksList(data);

    saveBooksData(books, KFeaturedbox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiServices.get(
        endPoint: 'volumes?q=programming&Filtering=free_ebooks&Sorting=newest');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, KNewestbox);
    return books;
  }
}

List<BookEntity> getBooksList(Map<String, dynamic> data) {
  List<BookEntity> books = [];
  for (var bookMap in data['items']) {
    books.add(
      BookModel.fromJson(bookMap),
    );
  }
  return books;
}

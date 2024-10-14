import 'package:bookcleanarch_app/Features/home/domain/entites/book_entity.dart';
import 'package:bookcleanarch_app/constants.dart';
import 'package:hive/hive.dart';

void saveBooksData(List<BookEntity> books,String booksName) {
    var box = Hive.box(KFeaturedbox);
    box.addAll(books);
  }
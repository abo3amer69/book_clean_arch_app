import 'package:hive/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity extends HiveObject{
  @HiveField(0)
  final String bookid;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String? authrName;
  @HiveField(4)
  final num? price;
  @HiveField(5)
  final num? rating;

  BookEntity(
      {required this.bookid,
      required this.image,
      required this.title,
      required this.authrName,
      required this.price,
      required this.rating});
}

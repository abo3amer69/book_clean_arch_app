class BookEntity {
  final String bookid;
  final String? image;
  final String title;
  final String? authrName;
  final num? price;
  final num? rating;

  BookEntity(
      {required this.bookid,
      required this.image,
      required this.title,
      required this.authrName,
      required this.price,
      required this.rating});
}

class BookModel {
  final String docId;
  final String dateTime;
  final String bookName;
  final String bookAuthor;
  final String rate;
  final String bookDescription;
  final double price;
  final String imageUrl;
  final String categoryId;
  final String categoryName;

  BookModel({
    required this.price,
    required this.imageUrl,
    required this.bookName,
    required this.docId,
    required this.bookDescription,
    required this.categoryId,
    required this.categoryName,
    required this.rate,
    required this.bookAuthor,
    required this.dateTime,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      docId: json["doc_id"] as String? ?? "",
      imageUrl: json["image_url"] as String? ?? "",
      categoryId: json["category_id"] as String? ?? "",
      categoryName: json["category_name"] as String? ?? "",
      bookName: json["product_name"] as String? ?? "",
      bookDescription: json["product_description"] as String? ?? "",
      price: json["price"] as double? ?? 0.0,
      rate: json["rate"] as String? ?? "",
      bookAuthor: json["book_author"] as String? ?? "",
      dateTime: json["date_time"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "doc_id": "",
      "image_url": imageUrl,
      "product_name": bookName,
      "product_description": bookDescription,
      "price": price,
      "category_id": categoryId,
      "category_name": categoryName,
      "rate": rate,
      "book_author": bookAuthor,
      "date_time": dateTime
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      "image_url": imageUrl,
      "product_name": bookName,
      "category_name": categoryName,
      "product_description": bookDescription,
      "price": price,
      "category_id": categoryId,
      "rate": rate,
      "book_author": bookAuthor,
      "date_time": dateTime
    };
  }

  BookModel copyWith({
    String? docId,
    String? bookName,
    String? bookAuthor,
    String? rate,
    String? bookDescription,
    double? price,
    String? imageUrl,
    String? categoryId,
    String? categoryName,
    String? dateTime,
  }) =>
      BookModel(
        price: price ?? this.price,
        dateTime: dateTime ?? this.dateTime,
        imageUrl: imageUrl ?? this.imageUrl,
        bookName: bookName ?? this.bookName,
        docId: docId ?? this.docId,
        bookDescription: bookDescription ?? this.bookDescription,
        categoryId: categoryId ?? this.categoryId,
        categoryName: categoryName ?? this.categoryName,
        rate: rate ?? this.rate,
        bookAuthor: bookAuthor ?? this.bookAuthor,
      );
}

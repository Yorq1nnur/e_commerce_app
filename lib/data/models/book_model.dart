class BookModel {
  final String docId;
  final String bookName;
  final String bookDescription;
  final double price;
  final String imageUrl;
  final String categoryId;

  BookModel({
    required this.price,
    required this.imageUrl,
    required this.bookName,
    required this.docId,
    required this.bookDescription,
    required this.categoryId,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      docId: json["doc_id"] as String? ?? "",
      imageUrl: json["image_url"] as String? ?? "",
      categoryId: json["category_id"] as String? ?? "",
      bookName: json["product_name"] as String? ?? "",
      bookDescription: json["product_description"] as String? ?? "",
      price: json["price"] as double? ?? 0.0,
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
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      "image_url": imageUrl,
      "product_name": bookName,
      "product_description": bookDescription,
      "price": price,
      "category_id": categoryId,
    };
  }
}

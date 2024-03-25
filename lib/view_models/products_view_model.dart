import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/data/models/book_model.dart';
import 'package:e_commerce_app/utils/constants/app_constants.dart';
import 'package:flutter/cupertino.dart';

import '../utils/utility_functions.dart';

class ProductsViewModel extends ChangeNotifier {
  bool _isLoading = false;

  bool get getLoader => _isLoading;

  List<BookModel> categoryProduct = [];

  Stream<List<BookModel>> listenProducts() => FirebaseFirestore.instance
      .collection(AppConstants.books)
      .snapshots()
      .map(
        (event) =>
            event.docs.map((doc) => BookModel.fromJson(doc.data())).toList(),
      );

  Future<void> getProductsByCategory(String categoryDocId) async {
    _notify(true);
    await FirebaseFirestore.instance
        .collection(AppConstants.books)
        .where("category_id", isEqualTo: categoryDocId)
        .get()
        .then((snapshot) {
      categoryProduct =
          snapshot.docs.map((e) => BookModel.fromJson(e.data())).toList();
    });
    _notify(false);
  }

  insertProducts(BookModel productModel, BuildContext context) async {
    try {
      _notify(true);
      var cf = await FirebaseFirestore.instance
          .collection(AppConstants.books)
          .add(productModel.toJson());

      await FirebaseFirestore.instance
          .collection(AppConstants.books)
          .doc(cf.id)
          .update({"doc_id": cf.id});

      _notify(false);
    } on FirebaseException catch (error) {
      if (!context.mounted) return;
      showSnackbar(
        context: context,
        message: error.code,
      );
    }
  }

  updateProduct(BookModel productModel, BuildContext context) async {
    try {
      _notify(true);
      await FirebaseFirestore.instance
          .collection(AppConstants.books)
          .doc(productModel.docId)
          .update(productModel.toJsonForUpdate());

      _notify(false);
    } on FirebaseException catch (error) {
      if (!context.mounted) return;
      showSnackbar(
        context: context,
        message: error.code,
      );
    }
  }

  deleteProduct(String docId, BuildContext context) async {
    try {
      _notify(true);
      await FirebaseFirestore.instance
          .collection(AppConstants.books)
          .doc(docId)
          .delete();

      _notify(false);
    } on FirebaseException catch (error) {
      if (!context.mounted) return;
      showSnackbar(
        context: context,
        message: error.code,
      );
    }
  }

  _notify(bool v) {
    _isLoading = v;
    notifyListeners();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import '../data/models/category_model.dart';
import '../utils/constants/app_constants.dart';
import '../utils/utility_functions.dart';

class CategoriesViewModel extends ChangeNotifier {
  bool _isLoading = false;

  bool get getLoader => _isLoading;

  List<CategoryModel> categories = [];

  CategoriesViewModel() {
    getCategories();
  }

  Future<void> getCategories() async {
    _notify(true);
    await FirebaseFirestore.instance
        .collection(AppConstants.categories)
        .get()
        .then((snapshot) {
      categories =
          snapshot.docs.map((e) => CategoryModel.fromJson(e.data())).toList();
    });
    _notify(false);
  }

  Stream<List<CategoryModel>> listenCategories() {
    return FirebaseFirestore.instance
        .collection(
          AppConstants.categories,
        )
        .snapshots()
        .map(
          (event) => event.docs
              .map((doc) => CategoryModel.fromJson(doc.data()))
              .toList(),
        );
  }

  insertCategory(CategoryModel categoryModel, BuildContext context) async {
    try {
      _notify(true);
      var cf = await FirebaseFirestore.instance
          .collection(AppConstants.categories)
          .add(categoryModel.toJson());

      await FirebaseFirestore.instance
          .collection(AppConstants.categories)
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

  updateCategory(CategoryModel categoryModel, BuildContext context) async {
    try {
      _notify(true);
      await FirebaseFirestore.instance
          .collection(AppConstants.categories)
          .doc(categoryModel.docId)
          .update(categoryModel.toJsonForUpdate());

      _notify(false);
    } on FirebaseException catch (error) {
      if (!context.mounted) return;
      showSnackbar(
        context: context,
        message: error.code,
      );
    }
  }

  // deleteCategory(String docId, BuildContext context, CategoryModel categoryModel) async {
  //   try {
  //     _notify(true);
  //     await FirebaseFirestore.instance
  //         .collection(AppConstants.categories)
  //         .doc(categoryModel.docId)
  //         .delete();
  //    await FirebaseStorage.instance.ref().child(categoryModel.imageUrl).delete();
  //     await deleteProductsByCategory(
  //       categoryDocId: docId,
  //     );
  //
  //     // await deleteImagesByCategory(categoryDocId: docId);
  //
  //     _notify(false);
  //   } on FirebaseException catch (error) {
  //     if (!context.mounted) return;
  //     showSnackbar(
  //       context: context,
  //       message: error.code,
  //     );
  //   }
  // }
  deleteCategory(CategoryModel categoryModel, BuildContext context) async {
    try {
      _notify(true);
      await FirebaseFirestore.instance
          .collection(AppConstants.categories)
          .doc(categoryModel.docId)
          .delete();
      FirebaseStorage.instance.ref().child(categoryModel.imageUrl).delete();
      _notify(false);
    } on FirebaseException catch (error) {
      if (!context.mounted) return;
      showSnackbar(
        context: context,
        message: error.code,
      );
    }
  }
  Future<void> deleteProductsByCategory({required String categoryDocId}) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection(AppConstants.books)
              .where("category_id", isEqualTo: categoryDocId)
              .get();

      final List<Future<void>> deleteFutures = [];

      for (final doc in querySnapshot.docs) {
        deleteFutures.add(doc.reference.delete());
      }

      await Future.wait(deleteFutures);
      debugPrint("All products in category $categoryDocId deleted successfully");
    } catch (error) {
      debugPrint("Error deleting products: $error");
      // Handle error according to your app's requirements
    }
  }

  // Future<void> deleteImagesByCategory({required String categoryDocId}) async {
  //   try {
  //     final QuerySnapshot<Map<String, dynamic>> querySnapshot =
  //     await FirebaseFirestore.instance
  //         .collection(AppConstants.books)
  //         .where("category_id", isEqualTo: categoryDocId)
  //         .get();
  //
  //     final List<Future<void>> deleteImageFutures = [];
  //
  //     for (final doc in querySnapshot.docs) {
  //       final data = doc.data();
  //       final String? imageUrl = data['image_url'];
  //
  //       if (imageUrl != null) {
  //         // Extracting the image name from the URL
  //         final imageName = imageUrl;
  //         final Reference storageReference =
  //         FirebaseStorage.instance.ref().child('files/images/$imageName');
  //
  //         // Deleting the image from Firestore
  //         deleteImageFutures.add(storageReference.delete());
  //       }
  //     }
  //
  //     await Future.wait(deleteImageFutures);
  //     debugPrint("All images in category $categoryDocId deleted successfully");
  //   } catch (error) {
  //     debugPrint("Error deleting images: $error");
  //     // Handle error according to your app's requirements
  //   }
  // }


  _notify(bool v) {
    _isLoading = v;
    notifyListeners();
  }
}

import 'package:e_commerce_app/screens/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../data/models/book_model.dart';
import '../../../view_models/products_view_model.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text("Products"),
          actions: [
            ZoomTapAnimation(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteNames.addBookRoute,
                );
              },
              child: const Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
          ],
        ),
        body: StreamBuilder<List<BookModel>>(
          stream: context.read<ProductsViewModel>().listenProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (snapshot.hasData) {
              List<BookModel> list = snapshot.data as List<BookModel>;
              return ListView(
                children: [
                  ...List.generate(
                    list.length,
                    (index) {
                      BookModel product = list[index];
                      return ListTile(
                        leading: Image.network(
                          product.imageUrl,
                          width: 50,
                        ),
                        title: Text(product.bookName),
                        subtitle: Text(product.docId),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  context
                                      .read<ProductsViewModel>()
                                      .deleteProduct(product.docId, context);
                                },
                                icon: const Icon(Icons.delete),
                              ),
                              IconButton(
                                onPressed: () {
                                  context
                                      .read<ProductsViewModel>()
                                      .updateProduct(
                                        BookModel(
                                          price: product.price,
                                          imageUrl:
                                              "https://upload.wikimedia.org/wikipedia/commons/2/2c/NOKIA_1280.jpg",
                                          bookName: "Galaxy",
                                          docId: product.docId,
                                          bookDescription: "",
                                          categoryId: product.categoryId,
                                        ),
                                        context,
                                      );
                                },
                                icon: const Icon(Icons.edit),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

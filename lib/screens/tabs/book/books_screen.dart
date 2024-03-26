import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/screens/edit_book/edit_book_screen.dart';
import 'package:e_commerce_app/screens/routes.dart';
import 'package:e_commerce_app/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../data/models/book_model.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../view_models/notifications_view_model.dart';
import '../../../view_models/books_view_model.dart';
import '../../book_details/book_details_screen.dart';

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
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "Books",
            style: AppTextStyle.interBold.copyWith(
              color: AppColors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
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
          stream: context.read<BooksViewModel>().listenProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (snapshot.hasData) {
              List<BookModel> list = snapshot.data as List<BookModel>;
              return GridView.count(
                primary: false,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 20.h,
                ),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 0.5,
                children: [
                  ...List.generate(
                    list.length,
                    (index) => Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.black,
                          width: 2.w,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ZoomTapAnimation(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookDetailsScreen(
                                    bookModel: list[index],
                                  ),
                                ),
                              );
                            },
                            child: CachedNetworkImage(
                              imageUrl: list[index].imageUrl,
                              height: 200.h,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            list[index].bookName,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ZoomTapAnimation(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditBookScreen(
                                        bookModel: list[index],
                                      ),
                                    ),
                                  );
                                },
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                width: 50.w,
                              ),
                              ZoomTapAnimation(
                                onTap: () async {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: AppColors.white,
                                        title:
                                            const Text("Ishonchingiz komilmi?"),
                                        titleTextStyle:
                                            AppTextStyle.interBold.copyWith(
                                          color: AppColors.black,
                                          fontSize: 20.sp,
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () async {
                                              context
                                                  .read<BooksViewModel>()
                                                  .deleteProduct(
                                                    list[index].docId,
                                                    context,
                                                  );
                                              if (!context.mounted) return;
                                              context
                                                  .read<
                                                      NotificationsViewModel>()
                                                  .showNotifications(
                                                    title:
                                                        "${list[index].bookName} NOMLI YANGI KITOB O'CHIRILDI!!!",
                                                    body: list[index].bookName,
                                                    id: DateTime.now()
                                                        .millisecond,
                                                  );
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'Yes',
                                              style: AppTextStyle.interBold
                                                  .copyWith(
                                                color: AppColors.black,
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              'No',
                                              style: AppTextStyle.interBold
                                                  .copyWith(
                                                      color: AppColors.black),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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

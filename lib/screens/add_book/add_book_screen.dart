import 'package:e_commerce_app/data/models/book_model.dart';
import 'package:e_commerce_app/data/models/category_model.dart';
import 'package:e_commerce_app/screens/add_book/widgets/category_button.dart';
import 'package:e_commerce_app/utils/styles/app_text_style.dart';
import 'package:e_commerce_app/view_models/books_view_model.dart';
import 'package:e_commerce_app/view_models/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../utils/colors/app_colors.dart';
import '../../view_models/notifications_view_model.dart';

class AddBookScreen extends StatefulWidget {
  const AddBookScreen({super.key});

  @override
  State<AddBookScreen> createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  final TextEditingController bookNameController = TextEditingController();
  final TextEditingController bookDescriptionController =
      TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController bookAuthorController = TextEditingController();

  @override
  void dispose() {
    bookNameController.dispose();
    imageUrlController.dispose();
    super.dispose();
  }

  String categoryDocId = '';
  int activeIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: ZoomTapAnimation(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.black,
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.white,
          title: Text(
            "ADD BOOK",
            style: AppTextStyle.interBold.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            bottom: 20.h,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 10,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 10.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFormField(
                              controller: bookNameController,
                              decoration: InputDecoration(
                                label: const Text(
                                  "BOOK NAME",
                                ),
                                labelStyle: AppTextStyle.interBold.copyWith(
                                  fontSize: 10.sp,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    16.r,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.black54,
                                    width: 2.w,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    16.r,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.w,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    16.r,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.w,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            TextFormField(
                              controller: bookAuthorController,
                              decoration: InputDecoration(
                                label: const Text(
                                  "BOOK AUTHOR",
                                ),
                                labelStyle: AppTextStyle.interBold.copyWith(
                                  fontSize: 10.sp,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    16.r,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.black54,
                                    width: 2.w,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    16.r,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.w,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    16.r,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.w,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            TextFormField(
                              controller: bookDescriptionController,
                              decoration: InputDecoration(
                                label: const Text(
                                  "BOOK DESCRIPTION",
                                ),
                                labelStyle: AppTextStyle.interBold.copyWith(
                                  fontSize: 10.sp,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    16.r,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.black54,
                                    width: 2.w,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    16.r,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.w,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    16.r,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.w,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            TextFormField(
                              controller: imageUrlController,
                              decoration: InputDecoration(
                                label: const Text(
                                  "IMAGE URL",
                                ),
                                labelStyle: AppTextStyle.interBold.copyWith(
                                  fontSize: 10.sp,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    16.r,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.black54,
                                    width: 2.w,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    16.r,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.w,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    16.r,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.w,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            TextFormField(
                              controller: rateController,
                              decoration: InputDecoration(
                                label: const Text(
                                  "BOOK'S RATE",
                                ),
                                labelStyle: AppTextStyle.interBold.copyWith(
                                  fontSize: 10.sp,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    16.r,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.black54,
                                    width: 2.w,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    16.r,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.w,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    16.r,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.w,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            TextFormField(
                              controller: priceController,
                              decoration: InputDecoration(
                                label: const Text(
                                  "BOOK'S PRICE",
                                ),
                                labelStyle: AppTextStyle.interBold.copyWith(
                                  fontSize: 10.sp,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    16.r,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.black54,
                                    width: 2.w,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    16.r,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.w,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    16.r,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.w,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Text(
                          "PLEASE, SELECT CATEGORY:",
                          textAlign: TextAlign.center,
                          style: AppTextStyle.interBold.copyWith(
                            color: AppColors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: StreamBuilder<List<CategoryModel>>(
                          stream: context
                              .read<CategoriesViewModel>()
                              .listenCategories(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(snapshot.error.toString()),
                              );
                            }
                            if (snapshot.hasData) {
                              List<CategoryModel> list =
                                  snapshot.data as List<CategoryModel>;
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ...List.generate(
                                    list.length,
                                    (index) => CategoryButton(
                                      title: list[index].categoryName,
                                      onTap: () {
                                        activeIndex = index;
                                        categoryDocId = list[index].docId;
                                        debugPrint(categoryDocId);
                                      },
                                      isActive: activeIndex == index,
                                    ),
                                  )
                                ],
                              );
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              ZoomTapAnimation(
                onTap: () async {
                  if (priceController.text != "" &&
                      imageUrlController.text != "" &&
                      bookDescriptionController.text != '' &&
                      bookNameController.text != '' &&
                      categoryDocId != '' &&
                      rateController.text != '' &&
                      bookAuthorController.text != '') {
                    BookModel category = BookModel(
                      price: double.parse(priceController.text),
                      imageUrl: imageUrlController.text,
                      rate: rateController.text,
                      bookAuthor: bookAuthorController.text,
                      bookName: bookNameController.text,
                      docId: "",
                      bookDescription: bookDescriptionController.text,
                      categoryId: categoryDocId,
                    );
                    await context
                        .read<BooksViewModel>()
                        .insertProducts(category, context);
                    if (!context.mounted) return;
                    Navigator.pop(context);
                    if (!context.mounted) return;
                    context.read<NotificationsViewModel>().showNotifications(
                          title:
                              "${bookNameController.text} NOMLI YANGI KITOB QO'SHILDI!!!",
                          body: bookDescriptionController.text,
                          id: DateTime.now().millisecond,
                        );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "PLEASE COMPLETE ALL DETAILS",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 30.w,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(
                      16.r,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "SAVE",
                      style: AppTextStyle.interBold.copyWith(
                        color: AppColors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

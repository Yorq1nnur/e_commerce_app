import 'package:e_commerce_app/data/models/book_model.dart';
import 'package:e_commerce_app/utils/styles/app_text_style.dart';
import 'package:e_commerce_app/view_models/books_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../data/models/category_model.dart';
import '../../utils/colors/app_colors.dart';
import '../../view_models/category_view_model.dart';
import '../../view_models/notifications_view_model.dart';
import '../add_book/widgets/category_button.dart';

class EditBookScreen extends StatefulWidget {
  const EditBookScreen({
    super.key,
    required this.bookModel,
  });

  final BookModel bookModel;

  @override
  State<EditBookScreen> createState() => _EditBookScreenState();
}

int activeIndex = -1;

class _EditBookScreenState extends State<EditBookScreen> {
  @override
  Widget build(BuildContext context) {
    String bookName = '';
    String bookDescription = '';
    String bookPrice = '';
    String imageUrl = '';
    String rate = '';
    String bookAuthor = '';
    String categoryDocId = '';

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
            "EDIT BOOK",
            style: AppTextStyle.interBold.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              // flex: 6,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormField(
                            onChanged: (v) {
                              bookName = v;
                            },
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
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
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            onChanged: (v) {
                              bookAuthor = v;
                            },
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
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            onChanged: (v) {
                              bookDescription = v;
                            },
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
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.next,
                            onChanged: (v) {
                              imageUrl = v;
                            },
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
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: (v) {
                              rate = v;
                            },
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
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            onChanged: (v) {
                              bookPrice = v;
                            },
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
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
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
            StreamBuilder<List<CategoryModel>>(
              stream: context.read<CategoriesViewModel>().listenCategories(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
                if (snapshot.hasData) {
                  List<CategoryModel> list =
                      snapshot.data as List<CategoryModel>;
                  return Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 5.h,
                      crossAxisSpacing: 5.w,
                      childAspectRatio: 1,
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      crossAxisCount: 2,
                      children: [
                        ...List.generate(
                          list.length,
                          (index) => CategoryButton(
                            title: list[index].categoryName,
                            onTap: () {
                              debugPrint(
                                  "\$\$\$\$\$\$\$\$\$========\n$activeIndex\n========\$\$\$\$\$\$\$\$\$");
                              categoryDocId = list[index].docId;
                              debugPrint(categoryDocId);
                              setState(() {
                                activeIndex = index;
                              });
                            },
                            isActive: activeIndex == index ||
                                widget.bookModel.categoryId ==
                                    list[index].docId,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            SizedBox(
              height: 24.h,
            ),
            ZoomTapAnimation(
              onTap: () async {
                BookModel category = BookModel(
                  imageUrl:
                      imageUrl == "" ? widget.bookModel.imageUrl : imageUrl,
                  rate: rate == "" ? widget.bookModel.rate : rate,
                  bookAuthor: bookAuthor == ""
                      ? widget.bookModel.bookAuthor
                      : bookAuthor,
                  bookName:
                      bookName == "" ? widget.bookModel.bookName : bookName,
                  docId: widget.bookModel.docId,
                  price: bookPrice == ""
                      ? widget.bookModel.price
                      : double.parse(bookPrice),
                  bookDescription: bookDescription == ""
                      ? widget.bookModel.bookDescription
                      : bookDescription,
                  categoryId: categoryDocId != ''
                      ? categoryDocId
                      : widget.bookModel.categoryId,
                );
                await context
                    .read<BooksViewModel>()
                    .updateProduct(category, context);
                if (!context.mounted) return;
                context.read<NotificationsViewModel>().showNotifications(
                      title: "$bookName NOMLI BOOK TAHRIRLANDI!!!",
                      body: bookDescription,
                      id: DateTime.now().millisecond,
                    );
                if (!context.mounted) return;
                Navigator.pop(context);
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
    );
  }
}

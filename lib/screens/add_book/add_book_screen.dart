import 'package:e_commerce_app/data/models/category_model.dart';
import 'package:e_commerce_app/utils/styles/app_text_style.dart';
import 'package:e_commerce_app/view_models/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../utils/colors/app_colors.dart';

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

  @override
  void dispose() {
    bookNameController.dispose();
    imageUrlController.dispose();
    super.dispose();
  }

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
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
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
              SizedBox(
                height: 24.h,
              ),

              const Spacer(),
              ZoomTapAnimation(
                onTap: () async {
                  if (bookNameController.text != "" &&
                      imageUrlController.text != "") {
                    CategoryModel category = CategoryModel(
                      imageUrl: imageUrlController.text,
                      categoryName: bookNameController.text,
                      docId: "",
                    );
                    await context
                        .read<CategoriesViewModel>()
                        .insertCategory(category, context);
                    if (!context.mounted) return;
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                      "PLEASE COMPLETE ALL DETAILS",
                      textAlign: TextAlign.center,
                    )));
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

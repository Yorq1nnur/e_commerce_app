import 'package:e_commerce_app/data/models/category_model.dart';
import 'package:e_commerce_app/utils/styles/app_text_style.dart';
import 'package:e_commerce_app/view_models/category_view_model.dart';
import 'package:e_commerce_app/view_models/notifications_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../utils/colors/app_colors.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  final TextEditingController categoryNameController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();

  @override
  void dispose() {
    categoryNameController.dispose();
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
            "ADD CATEGORY",
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
                controller: categoryNameController,
                decoration: InputDecoration(
                  label: const Text(
                    "CATEGORY NAME",
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
              const Spacer(),
              ZoomTapAnimation(
                onTap: () async {
                  if (categoryNameController.text != "" &&
                      imageUrlController.text != "") {
                    CategoryModel category = CategoryModel(
                      imageUrl: imageUrlController.text,
                      categoryName: categoryNameController.text,
                      docId: "",
                    );
                    await context.read<CategoriesViewModel>().insertCategory(
                          category,
                          context,
                        );
                    if (!context.mounted) return;
                    context.read<NotificationsViewModel>().showNotifications(
                          title: "${categoryNameController.text} NOMLI YANGI KATEGORIYA QO'SHILDI!!!",
                          body: categoryNameController.text,
                          id: DateTime.now().millisecond,
                        );
                    if (!context.mounted) return;
                    Navigator.pop(context);
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

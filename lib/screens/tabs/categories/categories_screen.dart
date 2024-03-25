import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/screens/edit_category/edit_category_screen.dart';
import 'package:e_commerce_app/screens/routes.dart';
import 'package:e_commerce_app/utils/colors/app_colors.dart';
import 'package:e_commerce_app/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../data/models/category_model.dart';
import '../../../view_models/category_view_model.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text(
          "Categories",
          style: AppTextStyle.interBold.copyWith(
            color: AppColors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                RouteNames.addCategoryRoute,
              );
            },
            icon: const Icon(
              Icons.add,
              color: AppColors.black,
            ),
          ),
        ],
      ),
      body: StreamBuilder<List<CategoryModel>>(
        stream: context.read<CategoriesViewModel>().listenCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {
            List<CategoryModel> list = snapshot.data as List<CategoryModel>;
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
              childAspectRatio: 0.45,
              children: [
                ...List.generate(
                  list.length,
                      (index) =>
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ZoomTapAnimation(child: CachedNetworkImage(
                            imageUrl: list[index].imageUrl,
                            height: 200.h,
                            width: 150.w,
                            fit: BoxFit.cover,
                          ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                list[index].categoryName,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ZoomTapAnimation(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              EditCategoryScreen(
                                                categoryModel: list[index],
                                              ),
                                        ),
                                      );
                                    },
                                    child: const Icon(Icons.edit),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  ZoomTapAnimation(
                                    onTap: () {
                                      context
                                          .read<CategoriesViewModel>()
                                          .deleteCategory(
                                        list[index].docId,
                                        context,
                                      );
                                    },
                                    child: const Icon(Icons.delete),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
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
    );
  }
}

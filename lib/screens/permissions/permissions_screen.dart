import 'package:e_commerce_app/permissions/app_permissions.dart';
import 'package:e_commerce_app/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../utils/colors/app_colors.dart';

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "APP PERMISSIONS REQUESTS",
            style: AppTextStyle.interBold.copyWith(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(
                permissionsList.length,
                (index) => ZoomTapAnimation(
                  onTap: () async {
                    permissionsList[index].permissionFunction();
                    debugPrint("==========\n\$\$\$\$\$\$\$\$\$\$\n==========");
                  },
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 10.w,
                    ),
                    padding: EdgeInsets.only(
                      top: 10.h,
                      left: 10.w,
                      bottom: 10.h,
                      right: 10.w,
                    ),
                    decoration: BoxDecoration(
                      color:
                          index == 10 ? Colors.redAccent : AppColors.c_2A3256,
                      borderRadius: BorderRadius.circular(
                        16.r,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        permissionsList[index].name,
                        style: AppTextStyle.interBold.copyWith(
                          color: Colors.lightGreen,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

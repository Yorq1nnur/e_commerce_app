import 'package:e_commerce_app/screens/routes.dart';
import 'package:e_commerce_app/utils/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/styles/app_text_style.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Settings",
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
                  RouteNames.newsRoute,
                );
              },
              child: SvgPicture.asset(
                AppImages.news,
                width: 24.w,
                height: 24.h,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
          ],
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                16.r,
              ),
              child: Image.network(
                "https://www.tenforums.com/attachments/tutorials/146359d1501443008-change-default-account-picture-windows-10-a-user.png",
                height: 24.h,
                width: 24.w,
                fit: BoxFit.cover,
              ),
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
              InkWell(
                borderRadius: BorderRadius.circular(
                  16.r,
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteNames.profileRoute,
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: 20.h,
                    left: 20.w,
                    bottom: 20.h,
                    right: 30.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.cCA5A5A.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(
                      16.r,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.person,
                            size: 20.w,
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Text(
                            "Profile",
                            style: AppTextStyle.interBold
                                .copyWith(color: Colors.lightGreen),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 20.h,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        // body: user != null
        //     ? context.watch<AuthViewModel>().loading
        //         ? const Center(child: CircularProgressIndicator())
        //         : Center(
        //             child: Padding(
        //               padding: const EdgeInsets.all(24),
        //               child: SingleChildScrollView(
        //                 child: Column(
        //                   children: [
        //                     Text(
        //                       user.uid,
        //                       style: AppTextStyle.interSemiBold
        //                           .copyWith(fontSize: 24),
        //                     ),
        //                     SizedBox(height: 12.h),
        //                     Text(
        //                       user.email.toString(),
        //                       style: AppTextStyle.interSemiBold
        //                           .copyWith(fontSize: 24),
        //                     ),
        //                     SizedBox(height: 12.h),
        //                     Text(
        //                       user.displayName.toString(),
        //                       style: AppTextStyle.interSemiBold
        //                           .copyWith(fontSize: 24),
        //                     ),
        //                     if (user.photoURL != null)
        //                       Image.network(
        //                         user.photoURL!,
        //                         width: 200,
        //                         height: 200,
        //                       ),
        //                     IconButton(
        //                       onPressed: () {
        //                         context.read<AuthViewModel>().updateImageUrl(
        //                             "https://www.tenforums.com/attachments/tutorials/146359d1501443008-change-default-account-picture-windows-10-a-user.png");
        //                       },
        //                       icon: const Icon(Icons.image),
        //                     )
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           )
        //     : const Center(
        //         child: Text("USER NOT EXIST"),
        //       ),
      ),
    );
  }
}

// onPressed: () {
// context.read<AuthViewModel>().logout(context);
// },

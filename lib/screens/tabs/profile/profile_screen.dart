import 'package:e_commerce_app/screens/routes.dart';
import 'package:e_commerce_app/utils/images/app_images.dart';
import 'package:e_commerce_app/view_models/notifications_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/styles/app_text_style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // User? user = context.watch<AuthViewModel>().getUser;

    List<int> indexes = context.watch<NotificationsViewModel>().indexes;

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
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...List.generate(
                  indexes.length,
                  (index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          indexes[index].toString(),
                          style: AppTextStyle.interBold,
                        ),
                        ZoomTapAnimation(
                          child: const Icon(
                            Icons.delete,
                            color: Colors.black,
                          ),
                          onTap: () {
                            context
                                .read<NotificationsViewModel>()
                                .cancelOneNotifications(
                                  id: indexes[index],
                                );
                          },
                        ),
                      ],
                    );
                  },
                ),
                indexes.isNotEmpty
                    ? Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 24.h,
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(
                            16.r,
                          ),
                        ),
                        child: ZoomTapAnimation(
                          onTap: () {
                            context
                                .read<NotificationsViewModel>()
                                .cancelAllNotifications();
                          },
                          child: Center(
                            child: Text(
                              "CANCEL ALL NOTIFICATIONS",
                              style: AppTextStyle.interBold.copyWith(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
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

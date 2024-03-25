import 'dart:io';
import 'package:e_commerce_app/utils/colors/app_colors.dart';
import 'package:e_commerce_app/utils/images/app_images.dart';
import 'package:e_commerce_app/view_models/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../utils/constants/app_constants.dart';
import '../../utils/styles/app_text_style.dart';
import '../routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
        body: context.watch<AuthViewModel>().loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                  vertical: 24.h,
                ),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Image.asset(AppImages.login),
                    Text(
                      "LOGIN",
                      textAlign: TextAlign.center,
                      style: AppTextStyle.interSemiBold.copyWith(
                        fontSize: 45,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "EMAIL",
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            16.r,
                          ),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.w,
                          ),
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
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            16.r,
                          ),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.w,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            16.r,
                          ),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.w,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
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
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            16.r,
                          ),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.w,
                          ),
                        ),
                        labelText: "PASSWORD",
                      ),
                    ),
                    Container(
                      height: 60.h,
                      width: double.infinity,
                      margin: EdgeInsets.only(
                        top: 24.h,
                        left: 24.w,
                        right: 24.w,
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              16.r,
                            ),
                          ),
                        ),
                        onPressed: () {
                          context.read<AuthViewModel>().loginUser(
                                context,
                                email: emailController.text,
                                password: passwordController.text,
                              );
                        },
                        child: Text(
                          "LOGIN",
                          style: AppTextStyle.interSemiBold.copyWith(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 60.h,
                      width: double.infinity,
                      margin: EdgeInsets.only(
                        top: 24.h,
                        left: 24.w,
                        right: 24.w,
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              16.r,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            RouteNames.registerRoute,
                          );
                        },
                        child: Text(
                          "REGISTER",
                          style: AppTextStyle.interSemiBold.copyWith(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 60.h,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 24.h,
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              16.r,
                            ),
                          ),
                        ),
                        onPressed: () {
                          context.read<AuthViewModel>().signInWithGoogle(
                                context,
                                Platform.isAndroid
                                    ? null
                                    : AppConstants.clientID,
                              );
                        },
                        child: Text(
                          "LOGIN WITH GOOGLE",
                          style: AppTextStyle.interSemiBold.copyWith(
                            fontSize: 16,
                            color: Colors.white,
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

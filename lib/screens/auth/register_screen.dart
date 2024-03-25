import 'package:e_commerce_app/utils/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/styles/app_text_style.dart';
import '../../view_models/auth_view_model.dart';
import '../routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
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
            ? const Center(child: CircularProgressIndicator())
            : Container(
                padding: EdgeInsets.all(24.w),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Image.asset(
                      AppImages.register,
                      width: 200.w,
                      height: 200.h,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Register",
                      textAlign: TextAlign.center,
                      style: AppTextStyle.interSemiBold.copyWith(
                        fontSize: 45,
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
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
                        labelText: "EMAIL",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
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
                            color: Colors.black54,
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
                        labelText: "USERNAME",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
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
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50.h,
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 24.h),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16))),
                        onPressed: () {
                          context.read<AuthViewModel>().registerUser(
                                context,
                                email: emailController.text,
                                password: passwordController.text,
                                username: usernameController.text,
                              );
                        },
                        child: Text(
                          "REGISTER",
                          style: AppTextStyle.interSemiBold
                              .copyWith(fontSize: 24, color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      height: 50.h,
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 24.h),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16))),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, RouteNames.loginRoute);
                        },
                        child: Text(
                          "LOGIN",
                          style: AppTextStyle.interSemiBold
                              .copyWith(fontSize: 24, color: Colors.white),
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

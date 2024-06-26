import 'package:e_commerce_app/screens/auth/widgets/my_text_field.dart';
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
        resizeToAvoidBottomInset: false,
        body: context.watch<AuthViewModel>().loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
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
                    MyTextField(
                      onChanged: (v) {},
                      textEditingController: emailController,
                      labelText: "EMAIL",
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.emailAddress,
                      imagePath: AppImages.email,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    MyTextField(
                      onChanged: (v) {},
                      textEditingController: usernameController,
                      labelText: "USER NAME",
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.name,
                      imagePath: AppImages.user,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    MyTextField(
                      onChanged: (v) {},
                      textEditingController: passwordController,
                      labelText: "PASSWORD",
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      imagePath: AppImages.lock,
                    ),
                    Container(
                      height: 50.h,
                      width: double.infinity,
                      margin: EdgeInsets.only(
                        top: 24.h,
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
                        onPressed: () async {
                          await context.read<AuthViewModel>().registerUser(
                                context,
                                email: emailController.text,
                                password: passwordController.text,
                                username: usernameController.text,
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
                      height: 50.h,
                      width: double.infinity,
                      margin: EdgeInsets.only(
                        top: 24.h,
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
                            RouteNames.loginRoute,
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
                    )
                  ],
                ),
              ),
      ),
    );
  }
}

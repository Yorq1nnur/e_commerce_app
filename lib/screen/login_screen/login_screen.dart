import 'package:e_commerce_app/screen/login_screen/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../utils/app_constants/app_constants.dart';
import '../../view_models/login_view_models.dart';
import '../user_screen/user_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    _init();
    super.initState();
  }

  Future<void> _init() async {
    Future.microtask(() {
      User? user = FirebaseAuth.instance.currentUser;
      if (user!.uid != '') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const UserScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 32.w,
          ),
          child: ListView(
            children: [
              Image.asset(
                "assets/images/img.webp",
                width: 226.w,
                height: 186.h,
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 110.h,
              ),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formKey,
                child: Column(
                  children: [
                    MyTextField(
                      type: TextInputType.text,
                      iconPath: "assets/icons/email.svg",
                      hinText: "Email",
                      onChanged: (value) {
                        context.read<LoginViewModel>().updateEmail(
                              value,
                            );
                      },
                      regExp: AppConstants.emailRegExp,
                      errorText: "Emailni to'g'ri kiriting",
                      controller: emailController,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    MyTextField(
                      type: TextInputType.name,
                      iconPath: "assets/icons/lock.svg",
                      hinText: "Password",
                      onChanged: (value) {
                        context.read<LoginViewModel>().updatePassword(
                              value,
                            );
                      },
                      regExp: AppConstants.passwordRegExp,
                      errorText: "Parolni to'g'ri kiriting",
                      controller: passwordController,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 60.w,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    bool validated = formKey.currentState!.validate();
                    if (validated) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "SUCCESS!",
                          ),
                        ),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserScreen(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            "ERROR!!!",
                          ),
                        ),
                      );
                    }
                    context.read<LoginViewModel>().login(context);
                  },
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.sp,
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

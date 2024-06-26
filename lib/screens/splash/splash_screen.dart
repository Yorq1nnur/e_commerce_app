import 'package:e_commerce_app/utils/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _init() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    if (!mounted) return;


      Navigator.pushReplacementNamed(context, RouteNames.tabRoute);

  }

  @override
  void initState() {
    _init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Lottie.asset(
          AppImages.lottie,
        ),
      ),
    );
  }
}

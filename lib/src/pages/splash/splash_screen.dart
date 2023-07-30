import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_grocer/src/common/app_name_widget.dart';
import 'package:green_grocer/src/constants/constants.dart';
import 'package:green_grocer/src/routers/pages_routers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 3),
      () => Get.toNamed(PagesRouters.signinRoute),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Constants.customSwatchColor,
              Constants.customSwatchColor.shade700,
            ],
          ),
        ),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppNameWidget(
              greenTitleColor: Colors.white,
              textSize: 40,
            ),
            SizedBox(height: 15),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

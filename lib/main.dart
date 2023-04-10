import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_grocer/src/routers/app_page.dart';

import 'src/routers/pages_routers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GreenGrocer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
      ),
      initialRoute: PagesRouters.splashRoute,
      getPages: AppPage.pages,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../presentation/posts_module/binding/posts_binding.dart';
import '../utils/app_route.dart';
import '../utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      initialBinding: PostsBinding(),
      initialRoute: '/',
      getPages: getPages,
    );
  }
}

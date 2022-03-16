import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Color(0xff243441),
        primaryColor: Color(0xffEB8034),
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white60),
      ),
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

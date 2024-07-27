import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:qr_scanner_app/views/screens/main_navigation.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "itim",
        scaffoldBackgroundColor: const Color(0xFF525252),
      ),
      home: const MainNavigation(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertask/routes/app_routes.dart';
import 'package:fluttertask/routes/routes.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initial,
      getPages: AppRoutes.routes,
    );
  }
}

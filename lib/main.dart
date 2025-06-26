import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertask/data/service/supbase_service.dart';
import 'package:fluttertask/firebase_options.dart';
import 'package:fluttertask/routes/app_routes.dart';
import 'package:fluttertask/routes/routes.dart';
import 'package:get/route_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await SupabaseService.initializeSupabase();
  // await SupabaseService.createBucket(Constants.kProfileImageBucket);
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

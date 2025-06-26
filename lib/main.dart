import 'package:flutter/material.dart';
import 'package:fluttertask/modules/edit_profile/views/edit_profile_screen.dart';
import 'package:fluttertask/modules/orders/screen/my_order_screen.dart';
import 'package:fluttertask/modules/profile/screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyOrderScreen(),
    );
  }
}

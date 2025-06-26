import 'package:flutter/material.dart';
import 'package:fluttertask/core/widgets/custom_app_bar.dart';
import 'package:fluttertask/modules/orders/data/model/order_model.dart';
import 'package:fluttertask/modules/orders/widgets/orders_list_view.dart';
import 'package:get/route_manager.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: CustomAppBar(title: 'My Orders', onBack: () => Get.back()),
            ),
            OrdersListView(orders: OrderModel.staticOrders),
          ],
        ),
      ),
    );
  }
}

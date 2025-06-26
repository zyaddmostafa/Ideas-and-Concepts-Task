import 'package:flutter/material.dart';
import 'package:fluttertask/core/widgets/custom_app_bar.dart';
import 'package:fluttertask/modules/orders/data/model/order_model.dart';
import 'package:fluttertask/modules/orders/widgets/order_section.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: CustomAppBar(title: 'My Orders'),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: OrderModel.staticOrders.length,
                itemBuilder: (context, index) {
                  final order = OrderModel.staticOrders[index];
                  return OrderSection(
                    status: order.status,
                    date: order.date,
                    items: order.items,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

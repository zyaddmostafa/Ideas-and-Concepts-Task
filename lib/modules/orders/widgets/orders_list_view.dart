import 'package:flutter/material.dart';
import 'package:fluttertask/modules/orders/data/model/order_model.dart';
import 'package:fluttertask/modules/orders/widgets/order_section.dart';

class OrdersListView extends StatelessWidget {
  final List<OrderModel> orders;
  final EdgeInsetsGeometry? padding;

  const OrdersListView({
    super.key,
    required this.orders,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: padding,
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return OrderSection(
            status: order.status,
            date: order.date,
            items: order.items,
          );
        },
      ),
    );
  }
}

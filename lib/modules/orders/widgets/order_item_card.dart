import 'package:flutter/material.dart';
import 'package:fluttertask/core/constants/app_color.dart';
import 'package:fluttertask/modules/orders/widgets/order_card_info.dart';
import 'package:fluttertask/modules/orders/widgets/order_item_action.dart';

class OrderItemCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String price;
  final String quantity;
  final String total;
  const OrderItemCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
    required this.quantity,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            fit: StackFit.loose,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColor.beige,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              Image.asset(imageUrl, width: 90, height: 90, fit: BoxFit.cover),
            ],
          ),
          const SizedBox(width: 12),
          OrderCardInfo(
            title: title,
            description: description,
            price: price,
            quantity: quantity,
            total: total,
          ),
          const SizedBox(width: 8),
          Row(
            children: const [
              OrderItemAction(icon: Icons.delete_outline),
              SizedBox(width: 8),
              OrderItemAction(icon: Icons.add_circle_outline),
            ],
          ),
        ],
      ),
    );
  }
}

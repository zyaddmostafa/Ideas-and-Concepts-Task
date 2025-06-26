import 'package:flutter/material.dart';
import 'package:fluttertask/core/constants/app_color.dart';
import 'package:fluttertask/modules/orders/data/model/order_item_model.dart';
import 'package:fluttertask/modules/orders/widgets/order_item_card.dart';

class OrderSection extends StatelessWidget {
  final String status;
  final String date;
  final List<OrderItemModel> items;
  const OrderSection({
    super.key,
    required this.status,
    required this.date,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order: $status',
                style: const TextStyle(fontSize: 13, color: Colors.black54),
              ),
              Text(
                date,
                style: const TextStyle(fontSize: 13, color: Colors.black54),
              ),
            ],
          ),
        ),
        const Divider(height: 8, thickness: 1, color: AppColor.terractta),
        ...items.map(
          (item) => OrderItemCard(
            imageUrl: item.imageUrl,
            title: item.title,
            description: item.description,
            price: item.price,
            quantity: item.quantity,
            total: item.total,
          ),
        ),
      ],
    );
  }
}

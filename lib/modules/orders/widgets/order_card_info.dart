import 'package:flutter/material.dart';
import 'package:fluttertask/core/constants/app_color.dart';

class OrderCardInfo extends StatelessWidget {
  const OrderCardInfo({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.quantity,
    required this.total,
  });

  final String title;
  final String description;
  final String price;
  final String quantity;
  final String total;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColor.terractta,
            ),
          ),
          Text(
            description,
            style: const TextStyle(fontSize: 13, color: Colors.black54),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              Text(quantity, style: const TextStyle(fontSize: 14)),
              const Spacer(),
              Text(
                'Total: $total',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

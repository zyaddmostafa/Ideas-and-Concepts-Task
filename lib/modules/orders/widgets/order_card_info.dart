import 'package:flutter/material.dart';
import 'package:fluttertask/core/constants/app_color.dart';
import 'package:fluttertask/core/utils/app_text_styles.dart';

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
            style: AppTextStyles.font18Bold.copyWith(color: AppColor.terractta),
          ),
          Text(
            description,
            style: AppTextStyles.font14Regular.copyWith(
              color: AppColor.black54,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Text(
                price,
                style: AppTextStyles.font16Regular.copyWith(
                  color: AppColor.black54,
                ),
              ),
              const Spacer(),
              Text(
                quantity,
                style: AppTextStyles.font16Regular.copyWith(
                  color: AppColor.black54,
                ),
              ),
              const Spacer(),
              Text(
                'Total: $total',
                style: AppTextStyles.font16Regular.copyWith(
                  color: AppColor.black54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

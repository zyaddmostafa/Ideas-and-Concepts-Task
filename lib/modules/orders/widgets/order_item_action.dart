import 'package:flutter/material.dart';
import 'package:fluttertask/core/constants/app_color.dart';

class OrderItemAction extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;
  const OrderItemAction({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColor.salamon, width: 1.5),
        ),
        child: Icon(icon, color: AppColor.salamon, size: 22),
      ),
    );
  }
}

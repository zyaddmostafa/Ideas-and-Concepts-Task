import 'package:flutter/material.dart';
import 'package:fluttertask/core/constants/app_color.dart';

class CustomAppBar extends StatelessWidget {
  final VoidCallback? onBack;
  final VoidCallback? onEdit;
  final String title;

  const CustomAppBar({
    super.key,
    this.onBack,
    this.onEdit,
    this.title = 'My Profile',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
            onPressed: onBack,
          ),

          Expanded(
            flex: 8,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColor.salamon,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

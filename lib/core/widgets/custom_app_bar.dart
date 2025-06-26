import 'package:flutter/material.dart';
import 'package:fluttertask/core/constants/app_color.dart';
import 'package:fluttertask/core/utils/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  final VoidCallback? onBack;

  final String title;

  const CustomAppBar({super.key, this.onBack, this.title = 'My Profile'});

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
              style: AppTextStyles.font22Bold.copyWith(color: AppColor.salamon),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

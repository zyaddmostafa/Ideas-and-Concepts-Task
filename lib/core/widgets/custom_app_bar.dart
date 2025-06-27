import 'package:flutter/material.dart';
import 'package:fluttertask/core/constants/app_color.dart';
import 'package:fluttertask/core/utils/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  final VoidCallback? onBack;

  final String title;
  final bool showEditButton;

  const CustomAppBar({
    super.key,
    this.onBack,
    this.title = 'My Profile',
    this.showEditButton = false,
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
              style: AppTextStyles.font22Bold.copyWith(color: AppColor.salamon),
            ),
          ),

          showEditButton
              ? IconButton(
                onPressed: null,
                icon: const Icon(Icons.edit, color: AppColor.salamon, size: 30),
              )
              : Spacer(),
        ],
      ),
    );
  }
}

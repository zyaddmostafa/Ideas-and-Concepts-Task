import 'package:flutter/material.dart';
import 'package:fluttertask/core/constants/app_color.dart';
import 'package:fluttertask/core/utils/app_text_styles.dart';

class UserInfo extends StatelessWidget {
  final String name;
  final String email;
  final Color backgroundColor;
  const UserInfo({
    super.key,
    required this.name,
    required this.email,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Text(name, style: AppTextStyles.font20Bold),

          Text(
            email,
            style: AppTextStyles.font15Medium.copyWith(
              color: AppColor.black.withValues(alpha: .8),
            ),
          ),
        ],
      ),
    );
  }
}

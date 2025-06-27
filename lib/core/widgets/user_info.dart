import 'package:flutter/material.dart';
import 'package:fluttertask/core/constants/app_color.dart';
import 'package:fluttertask/core/utils/app_text_styles.dart';

class UserInfo extends StatelessWidget {
  final String name;
  final String email;
  final Color backgroundColor;
  final double verticalSpace;
  const UserInfo({
    super.key,
    required this.name,
    required this.email,
    required this.backgroundColor,
    required this.verticalSpace,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: backgroundColor,
      padding: EdgeInsets.symmetric(vertical: verticalSpace),
      child: Column(
        children: [
          Text(name, style: AppTextStyles.font24Bold),

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

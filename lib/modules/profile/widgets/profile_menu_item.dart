import 'package:flutter/material.dart';
import 'package:fluttertask/core/constants/app_color.dart';
import 'package:fluttertask/core/utils/app_text_styles.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColor.salamon,
          child: Icon(icon, color: AppColor.black, size: 30),
        ),
        title: Text(
          label,
          style: AppTextStyles.font20Regular.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}

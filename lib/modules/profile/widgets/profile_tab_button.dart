import 'package:flutter/material.dart';
import 'package:fluttertask/core/constants/app_color.dart';

class ProfileTabButton extends StatelessWidget {
  final IconData icon;
  final String label;
  const ProfileTabButton({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
      child: Column(
        children: [
          Icon(icon, color: AppColor.black, size: 28),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(color: AppColor.black, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

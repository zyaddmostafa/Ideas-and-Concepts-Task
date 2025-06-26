import 'package:flutter/material.dart';
import 'package:fluttertask/core/constants/app_color.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  const ProfileMenuItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColor.salamon,
        child: Icon(icon, color: AppColor.black),
      ),
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
      onTap: () {},
    );
  }
}

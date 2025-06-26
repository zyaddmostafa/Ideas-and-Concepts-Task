import 'package:flutter/material.dart';

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
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),

          Text(
            email,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

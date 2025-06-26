import 'package:flutter/material.dart';
import 'package:fluttertask/core/constants/app_color.dart';

class ChangeProfileImage extends StatelessWidget {
  const ChangeProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        const CircleAvatar(
          radius: 55,
          backgroundImage: NetworkImage(
            'https://randomuser.me/api/portraits/women/44.jpg',
          ),
        ),
        Positioned(
          bottom: 4,
          right: 4,
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.salamon,
              shape: BoxShape.circle,
              border: Border.all(color: AppColor.white, width: 2),
            ),
            padding: const EdgeInsets.all(6),
            child: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
          ),
        ),
      ],
    );
  }
}

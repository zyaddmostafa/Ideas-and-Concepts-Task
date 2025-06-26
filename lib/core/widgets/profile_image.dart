import 'package:flutter/material.dart';
import 'package:fluttertask/core/constants/app_color.dart';

class ProfileImage extends StatelessWidget {
  final String imageUrl;
  final bool showCameraIcon;
  final double radius;
  final VoidCallback? onCameraTap;

  const ProfileImage({
    super.key,
    required this.imageUrl,
    this.showCameraIcon = true,
    this.radius = 55,
    this.onCameraTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(radius: radius, backgroundImage: NetworkImage(imageUrl)),
        if (showCameraIcon)
          Positioned(
            bottom: 4,
            right: 4,
            child: GestureDetector(
              onTap: onCameraTap,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.salamon,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColor.white, width: 2),
                ),
                padding: const EdgeInsets.all(6),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertask/core/constants/app_color.dart';
import 'package:fluttertask/core/constants/app_constants.dart';

class ProfileImage extends StatelessWidget {
  final String imageUrl;
  final bool showCameraIcon;
  final VoidCallback? onCameraTap;
  const ProfileImage({
    super.key,
    required this.imageUrl,
    this.showCameraIcon = true,
    this.onCameraTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: AppConstants.profileImageRadius,
          backgroundImage: NetworkImage(imageUrl),
          backgroundColor: AppColor.salamon.withValues(
            alpha: 0.2, // Adjust alpha for a subtle background color
          ),
        ),
        if (showCameraIcon)
          Positioned(
            bottom: 8,
            right: 8,
            child: GestureDetector(
              onTap: onCameraTap,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.salamon,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(6),
                child: Icon(Icons.camera_alt, color: AppColor.black, size: 24),
              ),
            ),
          ),
      ],
    );
  }
}

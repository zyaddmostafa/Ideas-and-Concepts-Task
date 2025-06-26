import 'package:flutter/material.dart';
import 'package:fluttertask/core/widgets/profile_image.dart';
import 'package:fluttertask/core/widgets/user_info.dart';

class ProfileHeader extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String email;
  final double avatarRadius;
  final bool showCameraIcon;
  final Color userInfoBackgroundColor;
  const ProfileHeader({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.email,
    this.avatarRadius = 60,
    this.showCameraIcon = false,
    this.userInfoBackgroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileImage(
          imageUrl: imageUrl,
          radius: avatarRadius,
          showCameraIcon: showCameraIcon,
        ),
        const SizedBox(height: 12),
        UserInfo(
          name: name,
          email: email,
          backgroundColor: userInfoBackgroundColor,
        ),
      ],
    );
  }
}

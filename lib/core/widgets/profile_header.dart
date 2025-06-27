import 'package:flutter/material.dart';
import 'package:fluttertask/core/widgets/profile_image.dart';
import 'package:fluttertask/core/widgets/user_info.dart';

class ProfileHeader extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String email;
  final bool showCameraIcon;
  final Color userInfoBackgroundColor;
  final VoidCallback? onImageTap;
  final double userInfoVerticalSpace;
  final double imageAndUserInfoVerticalSpace;
  const ProfileHeader({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.email,
    this.showCameraIcon = false,
    this.userInfoBackgroundColor = Colors.transparent,
    this.onImageTap,
    this.userInfoVerticalSpace = 8,
    this.imageAndUserInfoVerticalSpace = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onImageTap,
          child: ProfileImage(
            imageUrl: imageUrl,
            showCameraIcon: showCameraIcon,
          ),
        ),
        SizedBox(height: imageAndUserInfoVerticalSpace),
        UserInfo(
          verticalSpace: 8,
          name: name,
          email: email,
          backgroundColor: userInfoBackgroundColor,
        ),
      ],
    );
  }
}

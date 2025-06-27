import 'package:flutter/material.dart';
import 'package:fluttertask/core/constants/app_constants.dart';
import 'package:shimmer/shimmer.dart';

class ProfileHeaderShimmer extends StatelessWidget {
  final Color userInfoBackgroundColor;
  final double userInfoVerticalSpace;
  final double imageAndUserInfoVerticalSpace;
  const ProfileHeaderShimmer({
    super.key,
    this.userInfoBackgroundColor = Colors.transparent,
    this.userInfoVerticalSpace = 8,
    this.imageAndUserInfoVerticalSpace = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer(
          gradient: LinearGradient(
            colors: [Colors.grey[300]!, Colors.grey[100]!, Colors.grey[300]!],
            stops: const [0.1, 0.5, 0.9],
            begin: Alignment(-1.0, -0.5),
            end: Alignment(1.0, 0.5),
          ),
          child: Container(
            width: AppConstants.profileImageRadius * 2,
            height: AppConstants.profileImageRadius * 2,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
        SizedBox(height: imageAndUserInfoVerticalSpace),
        Shimmer(
          gradient: LinearGradient(
            colors: [Colors.grey[300]!, Colors.grey[100]!, Colors.grey[300]!],
            stops: const [0.1, 0.5, 0.9],
            begin: Alignment(-1.0, -0.5),
            end: Alignment(1.0, 0.5),
          ),
          child: Container(
            width: double.infinity,
            color: userInfoBackgroundColor,
            padding: EdgeInsets.symmetric(vertical: userInfoVerticalSpace),
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 24,
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 8),
                ),
                Container(width: 180, height: 16, color: Colors.white),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

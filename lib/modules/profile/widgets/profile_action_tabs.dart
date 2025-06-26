import 'package:flutter/material.dart';
import 'package:fluttertask/core/constants/app_color.dart';
import 'package:fluttertask/modules/profile/widgets/profile_tab_button.dart';
import 'package:fluttertask/routes/routes.dart';
import 'package:get/get.dart';

class ProfileActionTabs extends StatelessWidget {
  const ProfileActionTabs({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.salamon,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ProfileTabButton(
              icon: Icons.person,
              label: 'Edit Profile',
              onTap: () => Get.toNamed(Routes.editProfileScreen),
            ),
            Container(height: 40, width: 1.5, color: AppColor.white),
            ProfileTabButton(
              icon: Icons.local_offer_outlined,
              label: 'My Orders',
              onTap: () => Get.toNamed(Routes.myOrderScreen),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertask/core/widgets/custom_app_bar.dart';
import 'package:fluttertask/core/widgets/profile_header.dart';
import 'package:fluttertask/modules/profile/controller/profle_controller.dart';
import 'package:fluttertask/modules/profile/widgets/profile_action_tabs.dart';
import 'package:fluttertask/modules/profile/widgets/profile_screen_options.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const CustomAppBar(),
            const SizedBox(height: 16),
            GetBuilder<ProfileController>(
              init: ProfileController(Get.find()),
              builder: (controller) {
                return ProfileHeader(
                  imageUrl: controller.user?.imageUrl ?? '',
                  name: controller.user?.name ?? 'zyad',
                  email: controller.user?.email ?? 'zyad@gmail.com',
                );
              },
            ),

            const SizedBox(height: 20),
            ProfileActionTabs(),
            const SizedBox(height: 24),
            ProfileScreenOptions(),
          ],
        ),
      ),
    );
  }
}

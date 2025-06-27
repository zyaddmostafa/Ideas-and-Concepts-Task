import 'package:flutter/material.dart';
import 'package:fluttertask/core/widgets/custom_app_bar.dart';
import 'package:fluttertask/core/widgets/profile_header.dart';
import 'package:fluttertask/core/widgets/profile_header_shimmer.dart';
import 'package:fluttertask/modules/profile/controller/profle_controller.dart';
import 'package:fluttertask/modules/profile/widgets/profile_action_tabs.dart';
import 'package:fluttertask/modules/profile/widgets/profile_screen_options.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(showEditButton: true),
            const SizedBox(height: 18),
            Obx(() {
              if (controller.isLoading.value) {
                // Simple skeleton placeholder for avatar, name, and email
                return ProfileHeaderShimmer();
              }
              return ProfileHeader(
                imageUrl: controller.user?.imageUrl ?? '',
                name: controller.user?.name ?? 'NO Name',
                email: controller.user?.email ?? 'No Email',
              );
            }),
            const SizedBox(height: 8),
            ProfileActionTabs(),
            const SizedBox(height: 12),
            ProfileScreenOptions(),
          ],
        ),
      ),
    );
  }
}

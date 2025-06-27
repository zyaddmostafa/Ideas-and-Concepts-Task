import 'package:flutter/material.dart';
import 'package:fluttertask/core/widgets/custom_app_bar.dart';
import 'package:fluttertask/core/widgets/profile_header.dart';
import 'package:fluttertask/core/widgets/profile_header_shimmer.dart';
import 'package:fluttertask/modules/profile/controller/profle_controller.dart';
import 'package:fluttertask/modules/profile/widgets/profile_action_tabs.dart';
import 'package:fluttertask/modules/profile/widgets/profile_screen_options.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final controller = Get.find<ProfileController>();

  @override
  void initState() {
    controller.fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(showEditButton: true),
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

import 'package:flutter/widgets.dart';
import 'package:fluttertask/core/widgets/profile_header.dart';
import 'package:fluttertask/core/widgets/profile_header_shimmer.dart';
import 'package:fluttertask/modules/profile/controller/profle_controller.dart';
import 'package:get/get.dart';

class ProfileObx extends StatelessWidget {
  const ProfileObx({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final controller = Get.find<ProfileController>();
      if (controller.isLoading.value) {
        // Simple skeleton placeholder for avatar, name, and email
        return ProfileHeaderShimmer();
      }
      return ProfileHeader(
        imageUrl: controller.user?.imageUrl ?? '',
        name: controller.user?.name ?? 'zyad',
        email: controller.user?.email ?? 'zyad@gmail.com',
      );
    });
  }
}

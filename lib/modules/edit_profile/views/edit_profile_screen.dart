import 'package:flutter/material.dart';
import 'package:fluttertask/core/constants/app_color.dart';
import 'package:fluttertask/core/widgets/custom_app_bar.dart';
import 'package:fluttertask/core/widgets/profile_header.dart';
import 'package:fluttertask/data/models/user_model.dart';
import 'package:fluttertask/modules/edit_profile/controller/edit_profile_controller.dart';
import 'package:fluttertask/modules/edit_profile/widgets/custom_elevated_button.dart';
import 'package:fluttertask/modules/edit_profile/widgets/profile_edit_form.dart';
import 'package:fluttertask/routes/routes.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel argument = Get.arguments;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              // Custom App Bar
              CustomAppBar(onBack: () => Get.back()),
              const SizedBox(height: 16),

              // Profile Image with Camera Icon
              ProfileHeader(
                imageUrl: argument.imageUrl ?? '',
                name: argument.name ?? 'Madison Smith',
                email: argument.email ?? 'zyad@gmail.com',
                userInfoBackgroundColor: AppColor.beige,
                showCameraIcon: true,
              ),

              const SizedBox(height: 20),
              // Form Fields
              ProfileEditForm(),
              CustomElevatedButton(
                onPressed: () {
                  final controller = Get.find<EditProfileController>();
                  controller.updateUser();
                  Get.toNamed(Routes.profileScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

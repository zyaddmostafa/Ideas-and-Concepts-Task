import 'package:flutter/material.dart';
import 'package:fluttertask/core/constants/app_color.dart';
import 'package:fluttertask/core/widgets/custom_app_bar.dart';
import 'package:fluttertask/core/widgets/profile_header.dart';
import 'package:fluttertask/data/models/user_model.dart';
import 'package:fluttertask/modules/edit_profile/widgets/profile_edit_form.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

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
                imageUrl:
                    argument.imageUrl ??
                    'https://randomuser.me/api/portraits/women/44.jpg',
                name: argument.name ?? 'Madison Smith',
                email: argument.email ?? 'zyad@gmail.com',
                userInfoBackgroundColor: AppColor.beige,
                showCameraIcon: true,
              ),

              const SizedBox(height: 20),
              // Form Fields
              ProfileEditForm(
                fullName: argument.name ?? 'Madison Smith',
                email: argument.email ?? 'Madisons@Example.Com',
                mobileNumber: argument.phoneNumber ?? '+123 4567 890',
                dateOfBirth: argument.birthday ?? '01 / 04 / 199X',
                isMale: argument.isMale ?? true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertask/core/constants/app_constants.dart';
import 'package:fluttertask/core/widgets/custom_app_bar.dart';
import 'package:fluttertask/data/models/user_model.dart';
import 'package:fluttertask/modules/edit_profile/widgets/edit_profile_body.dart';
import 'package:fluttertask/modules/edit_profile/widgets/edit_profile_header_getx_builer.dart';
import 'package:fluttertask/modules/profile/controller/profle_controller.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel argument = Get.arguments;
    return WillPopScope(
      onWillPop: () async {
        Get.find<ProfileController>().fetchUser();
        return true; // Allow back navigation
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              CustomAppBar(onBack: () => Get.back()),
              const SizedBox(height: 16),
              EditProfileHeaderGetxBuilder(argument: argument),
              const SizedBox(height: 20),

              EditProfileBody(
                profileImage:
                    argument.imageUrl ?? AppConstants.defultProfileImageUrl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

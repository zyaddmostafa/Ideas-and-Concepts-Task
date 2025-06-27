import 'package:flutter/material.dart';
import 'package:fluttertask/core/constants/app_constants.dart';
import 'package:fluttertask/core/widgets/custom_app_bar.dart';
import 'package:fluttertask/data/models/user_model.dart';
import 'package:fluttertask/modules/edit_profile/widgets/edit_profile_body.dart';
import 'package:fluttertask/modules/edit_profile/widgets/edit_profile_header_getx_builer.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel argument = Get.arguments;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(onBack: () => Get.back()),
            const SizedBox(height: 18),
            EditProfileHeaderGetxBuilder(argument: argument),
            const SizedBox(height: 18),

            EditProfileBody(
              profileImage:
                  argument.imageUrl ?? AppConstants.defultProfileImageUrl,
            ),
          ],
        ),
      ),
    );
  }
}

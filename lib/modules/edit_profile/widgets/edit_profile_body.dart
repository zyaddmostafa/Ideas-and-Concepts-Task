import 'package:flutter/material.dart';
import 'package:fluttertask/core/constants/apis_constants.dart';
import 'package:fluttertask/data/models/user_model.dart';
import 'package:fluttertask/modules/edit_profile/controller/edit_profile_controller.dart';
import 'package:fluttertask/modules/edit_profile/widgets/custom_elevated_button.dart';
import 'package:fluttertask/modules/edit_profile/widgets/profile_edit_form.dart';
import 'package:fluttertask/routes/routes.dart';
import 'package:get/get.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key, required this.profileImage});
  final String profileImage;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            const ProfileEditForm(),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomElevatedButton(
                onPressed: () async {
                  final controller = Get.find<EditProfileController>();

                  _handleUpdateProfile(controller, profileImage);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _handleUpdateProfile(
  EditProfileController controller,
  String profileImage,
) async {
  // Validate form
  if (!controller.validateForm()) {
    return; // Stop if validation fails
  }

  try {
    String imageUrl =
        controller.imageUrl.value.isNotEmpty
            ? controller.imageUrl.value
            : profileImage;
    // Determine image URL to use

    // Update user profile
    controller.updateUser(
      ApiConstants.userId,
      UserModel(
        name: controller.fullNameController.text,
        email: controller.emailController.text,
        phoneNumber: controller.mobileNumberController.text,
        birthday: controller.dateOfBirthController.text,
        isMale: controller.isMale.value,
        imageUrl: imageUrl,
      ),
    );

    // Push to profile screen and trigger fetchUser after navigation
    Get.offAllNamed(Routes.profileScreen);

    controller.clear();
  } catch (e) {
    Get.snackbar(
      'Error',
      'Failed to update profile: ${e.toString()}',
      colorText: Colors.white,
    );
  }
}

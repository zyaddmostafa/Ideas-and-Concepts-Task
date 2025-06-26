import 'package:flutter/material.dart';
import 'package:fluttertask/modules/edit_profile/controller/edit_profile_controller.dart';
import 'package:fluttertask/modules/edit_profile/widgets/label_text.dart';
import 'package:fluttertask/modules/edit_profile/widgets/profile_text_field.dart';
import 'package:fluttertask/modules/edit_profile/widgets/gender_selection.dart';
import 'package:fluttertask/modules/edit_profile/widgets/custom_elevated_button.dart';
import 'package:get/get.dart';

class ProfileEditForm extends StatelessWidget {
  final String fullName;
  final String email;
  final String mobileNumber;
  final String dateOfBirth;
  final bool isMale;

  const ProfileEditForm({
    super.key,
    required this.fullName,
    required this.email,
    required this.mobileNumber,
    required this.dateOfBirth,
    required this.isMale,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LabelText('Full Name'),
          ProfileTextField(
            controller: Get.find<EditProfileController>().fullNameController,
          ),
          const SizedBox(height: 16),
          const LabelText('Email'),
          ProfileTextField(
            controller: Get.find<EditProfileController>().emailController,
          ),
          const SizedBox(height: 16),
          const LabelText('Mobile Number'),
          ProfileTextField(
            controller:
                Get.find<EditProfileController>().mobileNumberController,
          ),
          const SizedBox(height: 16),
          const LabelText('Date Of Birth'),
          ProfileTextField(
            controller: Get.find<EditProfileController>().dateOfBirthController,
          ),
          const SizedBox(height: 16),
          const LabelText('Gender'),
          const SizedBox(height: 8),
          GenderSelection(),
          const SizedBox(height: 28),
          const CustomElevatedButton(),
        ],
      ),
    );
  }
}

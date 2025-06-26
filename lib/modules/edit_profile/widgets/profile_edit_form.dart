import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertask/core/utils/app_regex.dart';
import 'package:fluttertask/modules/edit_profile/controller/edit_profile_controller.dart';
import 'package:fluttertask/modules/edit_profile/widgets/label_text.dart';
import 'package:fluttertask/modules/edit_profile/widgets/profile_text_field.dart';
import 'package:fluttertask/modules/edit_profile/widgets/gender_selection.dart';
import 'package:get/get.dart';

class ProfileEditForm extends StatelessWidget {
  const ProfileEditForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EditProfileController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Form(
        key: Get.find<EditProfileController>().formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LabelText('Full Name'),
            ProfileTextField(
              hintText: 'Enter your full name',
              controller: controller.fullNameController,
              validator: (values) {
                if (values == null || values.isEmpty) {
                  return 'Please enter your full name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            const LabelText('Email'),
            ProfileTextField(
              hintText: 'Enter your email',
              controller: controller.emailController,
              validator: (values) {
                log(values.toString());
                if (values == null || values.isEmpty) {
                  return 'Please enter your email';
                }
                if (!AppRegex.isValidEmail(values)) {
                  log('Invalid email: $values');
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            const LabelText('Mobile Number'),
            ProfileTextField(
              hintText: 'Enter your mobile number',
              controller:
                  Get.find<EditProfileController>().mobileNumberController,
              validator: (values) {
                log(values.toString());
                if (values == null || values.isEmpty) {
                  return 'Please enter your mobile number';
                }
                if (!AppRegex.isValidPhone(values)) {
                  log('Invalid mobile number:$values');
                  return 'Please enter a valid mobile number';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            const LabelText('Date Of Birth'),
            ProfileTextField(
              hintText: 'Enter your date of birth',
              controller: controller.dateOfBirthController,
              validator: (values) {
                if (values == null || values.isEmpty) {
                  return 'Please enter your date of birth';
                }
                if (!AppRegex.isValidBirthday(values)) {
                  return 'Please enter a valid date of birth';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            const LabelText('Gender'),
            const SizedBox(height: 8),
            GenderSelection(),
            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}

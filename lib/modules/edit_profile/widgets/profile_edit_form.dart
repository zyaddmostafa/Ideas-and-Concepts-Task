import 'package:flutter/material.dart';
import 'package:fluttertask/modules/edit_profile/widgets/label_text.dart';
import 'package:fluttertask/modules/edit_profile/widgets/profile_text_field.dart';
import 'package:fluttertask/modules/edit_profile/widgets/gender_selection.dart';
import 'package:fluttertask/modules/edit_profile/widgets/custom_elevated_button.dart';

class ProfileEditForm extends StatelessWidget {
  final String fullName;
  final String email;
  final String mobileNumber;
  final String dateOfBirth;

  const ProfileEditForm({
    super.key,
    required this.fullName,
    required this.email,
    required this.mobileNumber,
    required this.dateOfBirth,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LabelText('Full Name'),
          ProfileTextField(initialValue: fullName),
          const SizedBox(height: 16),
          const LabelText('Email'),
          ProfileTextField(initialValue: email),
          const SizedBox(height: 16),
          const LabelText('Mobile Number'),
          ProfileTextField(initialValue: mobileNumber),
          const SizedBox(height: 16),
          const LabelText('Date Of Birth'),
          ProfileTextField(initialValue: dateOfBirth),
          const SizedBox(height: 16),
          const LabelText('Gender'),
          const SizedBox(height: 8),
          const GenderSelection(),
          const SizedBox(height: 28),
          const CustomElevatedButton(),
        ],
      ),
    );
  }
}

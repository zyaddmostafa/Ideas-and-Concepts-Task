import 'package:flutter/material.dart';
import 'package:fluttertask/core/constants/app_color.dart';
import 'package:fluttertask/core/widgets/custom_app_bar.dart';
import 'package:fluttertask/core/widgets/user_info.dart';
import 'package:fluttertask/modules/edit_profile/widgets/label_text.dart';
import 'package:fluttertask/modules/edit_profile/widgets/profile_text_field.dart';
import 'package:fluttertask/modules/edit_profile/widgets/gender_selection.dart';
import 'package:fluttertask/modules/edit_profile/widgets/change_profile_image.dart';
import 'package:fluttertask/modules/edit_profile/widgets/custom_elevated_button.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              // Custom App Bar
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: CustomAppBar(),
              ),
              const SizedBox(height: 16),

              // Profile Image with Camera Icon
              ChangeProfileImage(),
              const SizedBox(height: 16),
              // User Info
              const UserInfo(
                name: 'Madison Smith',
                email: 'ID: 25030024',
                backgroundColor: AppColor.beige,
              ),

              const SizedBox(height: 20),
              // Form Fields
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LabelText('Full Name'),
                    ProfileTextField(initialValue: 'Madison Smith'),
                    const SizedBox(height: 16),
                    const LabelText('Email'),
                    ProfileTextField(initialValue: 'Madisons@Example.Com'),
                    const SizedBox(height: 16),
                    const LabelText('Mobile Number'),
                    ProfileTextField(initialValue: '+123 4567 890'),
                    const SizedBox(height: 16),
                    const LabelText('Date Of Birth'),
                    ProfileTextField(initialValue: '01 / 04 / 199X'),
                    const SizedBox(height: 16),
                    const LabelText('Gender'),
                    const SizedBox(height: 8),
                    GenderSelection(),
                    const SizedBox(height: 28),

                    CustomElevatedButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

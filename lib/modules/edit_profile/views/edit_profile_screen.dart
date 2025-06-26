import 'package:flutter/material.dart';
import 'package:fluttertask/core/widgets/custom_app_bar.dart';
import 'package:fluttertask/core/widgets/profile_header.dart';
import 'package:fluttertask/modules/edit_profile/widgets/profile_edit_form.dart';

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
              CustomAppBar(),
              const SizedBox(height: 16),

              // Profile Image with Camera Icon
              ProfileHeader(
                imageUrl: 'https://randomuser.me/api/portraits/women/44.jpg',
                name: 'Madison Smith',
                email: 'zyad@gmail.com',
              ),

              const SizedBox(height: 20),
              // Form Fields
              ProfileEditForm(
                fullName: 'Madison Smith',
                email: 'Madisons@Example.Com',
                mobileNumber: '+123 4567 890',
                dateOfBirth: '01 / 04 / 199X',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

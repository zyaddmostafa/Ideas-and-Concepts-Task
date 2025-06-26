import 'package:flutter/material.dart';
import 'package:fluttertask/core/widgets/custom_app_bar.dart';
import 'package:fluttertask/core/widgets/profile_header.dart';
import 'package:fluttertask/modules/profile/widgets/profile_action_tabs.dart';
import 'package:fluttertask/modules/profile/widgets/profile_screen_options.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const CustomAppBar(),
            const SizedBox(height: 16),
            ProfileHeader(
              imageUrl: 'https://randomuser.me/api/portraits/women/44.jpg',
              name: 'Madison Smith',
              email: 'zyad@gmail.com',
            ),

            const SizedBox(height: 20),
            ProfileActionTabs(),
            const SizedBox(height: 24),
            ProfileScreenOptions(),
          ],
        ),
      ),
    );
  }
}

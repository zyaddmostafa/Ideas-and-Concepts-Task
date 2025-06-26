import 'package:flutter/material.dart';
import 'package:fluttertask/core/constants/app_color.dart';
import 'package:fluttertask/core/widgets/custom_app_bar.dart';
import 'package:fluttertask/core/widgets/user_info.dart';
import 'package:fluttertask/modules/profile/widgets/profile_menu_item.dart';
import 'package:fluttertask/modules/profile/widgets/profile_tab_button.dart';

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
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://randomuser.me/api/portraits/women/44.jpg',
              ), // Placeholder
            ),
            const SizedBox(height: 12),
            const UserInfo(
              name: 'Madison Smith',
              email: 'zyad@gmail.com',
              backgroundColor: AppColor.white,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.salamon,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ProfileTabButton(icon: Icons.person, label: 'Edit Profile'),
                    Container(height: 40, width: 1.5, color: AppColor.white),

                    ProfileTabButton(
                      icon: Icons.local_offer_outlined,
                      label: 'My Orders',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  ProfileMenuItem(icon: Icons.vpn_key, label: 'Privacy Policy'),
                  ProfileMenuItem(
                    icon: Icons.credit_card,
                    label: 'Payment Methods',
                  ),
                  ProfileMenuItem(
                    icon: Icons.notifications_none,
                    label: 'Notification',
                  ),
                  ProfileMenuItem(icon: Icons.settings, label: 'Settings'),
                  ProfileMenuItem(icon: Icons.help_outline, label: 'Help'),
                  ProfileMenuItem(icon: Icons.logout, label: 'Logout'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

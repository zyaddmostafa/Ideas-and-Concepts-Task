import 'package:flutter/material.dart';
import 'package:fluttertask/modules/profile/widgets/profile_menu_item.dart';

class ProfileScreenOptions extends StatelessWidget {
  const ProfileScreenOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ProfileMenuItem(icon: Icons.vpn_key, label: 'Privacy Policy'),
          ProfileMenuItem(icon: Icons.credit_card, label: 'Payment Methods'),
          ProfileMenuItem(
            icon: Icons.notifications_none,
            label: 'Notification',
          ),
          ProfileMenuItem(icon: Icons.settings, label: 'Settings'),
          ProfileMenuItem(icon: Icons.help_outline, label: 'Help'),
          ProfileMenuItem(icon: Icons.logout, label: 'Logout'),
        ],
      ),
    );
  }
}

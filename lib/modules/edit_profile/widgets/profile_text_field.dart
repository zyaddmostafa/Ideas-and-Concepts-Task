import 'package:flutter/material.dart';
import 'package:fluttertask/core/constants/app_color.dart';
import 'package:fluttertask/core/utils/app_text_styles.dart';
import 'package:fluttertask/modules/edit_profile/controller/edit_profile_controller.dart';
import 'package:get/instance_manager.dart';

class ProfileTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  final TextInputType? keyboardType;
  const ProfileTextField({
    super.key,
    required this.controller,
    this.validator,
    required this.hintText,
    this.keyboardType = TextInputType.text,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      autovalidateMode: Get.find<EditProfileController>().autoValidateMode,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: AppColor.beige,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      style: AppTextStyles.font15Medium,
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertask/core/constants/app_color.dart';
import 'package:fluttertask/core/constants/constants.dart';
import 'package:fluttertask/data/service/firebase_service.dart';
import 'package:fluttertask/data/models/user_model.dart';
import 'package:fluttertask/data/service/supbase_service.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileRepoImpl {
  final FirebaseService firebaseService;
  EditProfileRepoImpl(this.firebaseService);

  Future<void> updateUserProfile(String userId, UserModel user) async {
    try {
      await firebaseService.updateUserData(userId, user.toJson());
      throw Get.snackbar(
        'success',
        'User profile updated successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: AppColor.white,
      );
    } on Exception catch (e) {
      throw Get.snackbar(
        'Error',
        'Failed to update user profile: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: AppColor.white,
      );
    }
  }

  Future<File?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 800,
      maxHeight: 800,
      imageQuality: 80,
    );
    if (image != null) {
      final file = File(image.path);
      Get.snackbar(
        'Success',
        'Image selected successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: AppColor.white,
      );
      return file;
    } else {
      Get.snackbar(
        'Error',
        'No image selected',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: AppColor.white,
      );
      return null;
    }
  }

  Future<String?> uploadImageAndGetUrl(File image) async {
    try {
      // Upload to Supabase and get public URL
      final publicUrl = await SupabaseService.uploadImage(
        image,
        Constants.kProfileImagePath,
      );

      if (publicUrl != null) {
        Get.snackbar(
          'Success',
          'Image uploaded successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: AppColor.white,
        );
        return publicUrl;
      } else {
        Get.snackbar(
          'Error',
          'Failed to upload image',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: AppColor.white,
        );
        return null;
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Upload failed: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: AppColor.white,
      );
      return null;
    }
  }

  Future<String?> pickAndUploadImage() async {
    try {
      // Step 1: Pick image
      final imagePath = await pickImage();
      if (imagePath == null) return null;

      // Step 2: Upload image and get URL
      final publicUrl = await uploadImageAndGetUrl(imagePath);
      return publicUrl;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Process failed: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: AppColor.white,
      );
      return null;
    }
  }
}

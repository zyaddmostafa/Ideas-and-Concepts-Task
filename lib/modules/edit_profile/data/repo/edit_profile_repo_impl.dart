import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertask/core/constants/app_color.dart';
import 'package:fluttertask/core/constants/apis_constants.dart';
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
      Get.snackbar(
        'success',
        'User profile updated successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: AppColor.white,
      );
    } on Exception catch (e) {
      Get.snackbar(
        'Error',
        'Failed to update user profile: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: AppColor.white,
      );
      rethrow;
    }
  }

  Future<File?> pickImage() async {
    // clear the bucket first cause avoid duplicate images

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
      // Check if image already exists in Supabase
      final fileName = image.path.split(Platform.pathSeparator).last;
      final filePath = '${ApiConstants.kProfileImagePath}/$fileName';
      final existingUrl = await SupabaseService.imageExists(filePath);
      if (existingUrl != null) {
        Get.snackbar(
          'Info',
          'Image already exists. Using existing image.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: AppColor.white,
        );
        return existingUrl;
      }
      // Upload to Supabase and get public URL
      final publicUrl = await SupabaseService.uploadImage(
        image,
        ApiConstants.kProfileImagePath,
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

  Future<String?> imageExists(String filePath) async {
    try {
      final publicUrl = await SupabaseService.imageExists(filePath);
      if (publicUrl != null) {
        return publicUrl;
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Check failed: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: AppColor.white,
      );
      return null;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertask/core/constants/app_color.dart';
import 'package:fluttertask/data/service/firebase_service.dart';
import 'package:fluttertask/data/models/user_model.dart';
import 'package:get/get.dart';

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
}

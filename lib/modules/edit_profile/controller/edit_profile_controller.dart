import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertask/data/models/user_model.dart';
import 'package:fluttertask/modules/edit_profile/data/repo/edit_profile_repo_impl.dart';

class EditProfileController extends GetxController {
  final EditProfileRepoImpl repo;
  EditProfileController(this.repo);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final RxBool isMale = true.obs;

  Future<void> updateUser(String userId, UserModel user) async {
    await repo.updateUserProfile(userId, user);
    update();
  }
}

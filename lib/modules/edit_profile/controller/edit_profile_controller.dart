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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;
  final RxString imageUrl = ''.obs;

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  void updateUser(String userId, UserModel user) async {
    await repo.updateUserProfile(userId, user);

    update();
  }

  void pickAndUploadImage() async {
    final publicUrl = await repo.pickAndUploadImage();
    if (publicUrl != null && publicUrl.isNotEmpty) {
      imageUrl.value = publicUrl;
      update();
    }
  }

  void clear() {
    emailController.clear();
    fullNameController.clear();
    mobileNumberController.clear();
    dateOfBirthController.clear();
    isMale.value = true;
    imageUrl.value = '';
  }
}

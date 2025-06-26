import 'package:flutter/material.dart';
import 'package:fluttertask/core/constants/constants.dart';
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
  final AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  RxString? imageUrl = ''.obs;

  bool validateForm() {
    if (autoValidateMode == AutovalidateMode.always) {
      formKey.currentState?.validate();
    }
    return formKey.currentState?.validate() ?? false;
  }

  Future<void> updateUser() async {
    if (!validateForm()) {
      Get.snackbar('Validation Error', 'Please check all fields');
      return;
    }

    if (imageUrl?.value.isEmpty == true) {
      await repo.updateUserProfile(
        Constants.userId,
        UserModel(
          name: fullNameController.text,
          email: emailController.text,
          phoneNumber: mobileNumberController.text,
          birthday: dateOfBirthController.text,
          isMale: isMale.value,
        ),
      );
    }
    if (imageUrl?.value.isEmpty == false) {
      await repo.updateUserProfile(
        Constants.userId,
        UserModel(
          name: fullNameController.text,
          email: emailController.text,
          phoneNumber: mobileNumberController.text,
          birthday: dateOfBirthController.text,
          isMale: isMale.value,
          imageUrl: imageUrl!.value, // Use ! since imageUrl is not null here
        ),
      );
    }
    clear();
    update();
  }

  Future<void> pickAndUploadImage() async {
    final publicUrl = await repo.pickAndUploadImage();
    if (publicUrl != null && publicUrl.isNotEmpty) {
      imageUrl?.value = publicUrl; // Use ?. since imageUrl is nullable
      update(); //
    }
  }

  void clear() {
    emailController.clear();
    fullNameController.clear();
    mobileNumberController.clear();
    dateOfBirthController.clear();
    isMale.value = true;
    imageUrl?.value = '';
  }
}

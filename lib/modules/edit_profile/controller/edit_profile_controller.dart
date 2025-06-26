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
    update();
  }
}

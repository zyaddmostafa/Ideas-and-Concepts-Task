import 'dart:developer';

import 'package:fluttertask/core/constants/apis_constants.dart';
import 'package:get/get.dart';
import 'package:fluttertask/data/models/user_model.dart';
import 'package:fluttertask/modules/profile/data/repo/profile_repo_impl.dart';

class ProfileController extends GetxController {
  final ProfileRepoImpl repo;
  UserModel? user;
  final RxBool isLoading = true.obs;

  ProfileController(this.repo);
  @override
  void onInit() {
    super.onInit();
    fetchUser();
  }

  @override
  void onReady() {
    super.onReady();
    fetchUser();

    log('ProfileController is ready');
  }

  void fetchUser() async {
    isLoading.value = true;
    user = await repo.getUserProfile(ApiConstants.userId);
    log(
      'user fetched:[32m${user?.name}, ${user?.email} ${user?.imageUrl} ${user?.phoneNumber} ${user?.birthday} ${user?.isMale}[0m',
    );
    isLoading.value = false;
    update();
  }
}

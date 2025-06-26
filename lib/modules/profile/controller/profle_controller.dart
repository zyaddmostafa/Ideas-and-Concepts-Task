import 'dart:developer';

import 'package:fluttertask/core/constants/constants.dart';
import 'package:get/get.dart';
import 'package:fluttertask/data/models/user_model.dart';
import 'package:fluttertask/modules/profile/data/repo/profile_repo_impl.dart';

class ProfileController extends GetxController {
  final ProfileRepoImpl repo;
  UserModel? user;

  ProfileController(this.repo);
  @override
  void onInit() {
    super.onInit();
    fetchUser(); // Automatically fetches when screen loads
  }

  Future<void> fetchUser() async {
    user = await repo.getUserProfile(Constants.userId);
    log(
      'user fetched: ${user?.name}, ${user?.email} ${user?.imageUrl} ${user?.phoneNumber} ${user?.birthday} ${user?.isMale}',
    );
    update();
  }
}

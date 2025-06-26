import 'package:get/get.dart';
import 'package:fluttertask/modules/profile/controller/profle_controller.dart';
import 'package:fluttertask/modules/profile/data/repo/profile_repo_impl.dart';
import 'package:fluttertask/data/service/firebase_service.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    // Register the repo
    Get.lazyPut<ProfileRepoImpl>(() => ProfileRepoImpl(FirebaseService()));
    // Register the controller, letting GetX inject the repo
    Get.lazyPut(() => ProfileController(Get.find<ProfileRepoImpl>()));
  }
}

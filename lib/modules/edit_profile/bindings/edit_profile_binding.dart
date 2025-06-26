import 'package:get/get.dart';
import 'package:fluttertask/modules/edit_profile/controller/edit_profile_controller.dart';
import 'package:fluttertask/modules/edit_profile/data/repo/edit_profile_repo_impl.dart';
import 'package:fluttertask/data/service/firebase_service.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileRepoImpl>(
      () => EditProfileRepoImpl(FirebaseService()),
    );
    Get.lazyPut(() => EditProfileController(Get.find<EditProfileRepoImpl>()));
  }
}

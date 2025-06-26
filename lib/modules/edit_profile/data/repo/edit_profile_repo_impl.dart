import 'package:fluttertask/data/service/firebase_service.dart';
import 'package:fluttertask/data/models/user_model.dart';

class EditProfileRepoImpl {
  final FirebaseService firebaseService;
  EditProfileRepoImpl(this.firebaseService);

  Future<void> updateUserProfile(String userId, UserModel user) async {
    await firebaseService.updateUserData(userId, user.toJson());
  }
}

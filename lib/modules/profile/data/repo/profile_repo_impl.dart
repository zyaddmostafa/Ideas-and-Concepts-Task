import 'package:fluttertask/data/service/firebase_service.dart';
import 'package:fluttertask/data/models/user_model.dart';

class ProfileRepoImpl {
  final FirebaseService firebaseService;
  ProfileRepoImpl(this.firebaseService);

  Future<UserModel?> getUserProfile(String userId) async {
    final data = await firebaseService.fetchUserData(userId);
    return data != null ? UserModel.fromJson(data) : null;
  }
}

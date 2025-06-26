import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertask/core/constants/constants.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> fetchUserData(String userId) async {
    try {
      final doc =
          await _firestore
              .collection(Constants.userCollection)
              .doc(userId)
              .get();
      return doc.exists ? doc.data() : null;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateUserData(String userId, Map<String, dynamic> data) async {
    try {
      await _firestore
          .collection(Constants.userCollection)
          .doc(userId)
          .set(data, SetOptions(merge: true));
    } catch (e) {
      rethrow;
    }
  }
}

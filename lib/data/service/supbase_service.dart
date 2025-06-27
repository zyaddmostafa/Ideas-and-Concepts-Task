import 'dart:developer';
import 'dart:io';
import 'package:fluttertask/core/constants/apis_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;

class SupabaseService {
  static late Supabase _supabase; // Fixed typo: _supbase -> _supabase

  static Future<void> initializeSupabase() async {
    // Added Future<void> for proper async
    _supabase = await Supabase.initialize(
      url: ApiConstants.kSupabaseUrl,
      anonKey: ApiConstants.kSupabaseAnonKey,
    );
  }

  static Future<String?> uploadImage(File file, String path) async {
    try {
      String fileName = b.basename(file.path);

      // Upload the file
      await _supabase.client.storage
          .from(ApiConstants.kProfileImageBucket)
          .upload('$path/$fileName', file); // Fixed: removed extra dot

      // Get public URL
      final String publicUrl = _supabase.client.storage
          .from(ApiConstants.kProfileImageBucket)
          .getPublicUrl('$path/$fileName');

      return publicUrl;
    } catch (error) {
      log('Error uploading image: $error');
      return null;
    }
  }

  // Additional method to get public URL
  String getPublicUrl(String path) {
    return _supabase.client.storage
        .from(ApiConstants.kProfileImageBucket)
        .getPublicUrl(path);
  }

  static Future<String?> imageExists(String filePath) async {
    try {
      await _supabase.client.storage
          .from(ApiConstants.kProfileImageBucket)
          .info(filePath);

      log('Image exists at: $filePath');
      // Get and return the public URL if the image exists
      final String publicUrl = _supabase.client.storage
          .from(ApiConstants.kProfileImageBucket)
          .getPublicUrl(filePath);
      return publicUrl;
    } catch (error) {
      log('Image does not exist at: $filePath');
      return null;
    }
  }
}

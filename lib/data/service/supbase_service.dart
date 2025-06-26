import 'dart:developer';
import 'dart:io';
import 'package:fluttertask/core/constants/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;

class SupabaseService {
  static late Supabase _supabase; // Fixed typo: _supbase -> _supabase

  // static Future<void> createBucket(String bucketName) async {
  //   try {
  //     // Check if bucket exists first
  //     final buckets = await _supabase.client.storage.listBuckets();

  //     // If bucket already exists, return early
  //     if (buckets.any((bucket) => bucket.name == bucketName)) {
  //       log('Bucket "$bucketName" already exists');
  //       return;
  //     }

  //     // Create bucket only if it doesn't exist
  //     await _supabase.client.storage.createBucket(bucketName);
  //     log('Bucket "$bucketName" created successfully');
  //   } catch (error) {
  //     log('Error with bucket operations: $error');
  //     rethrow;
  //   }
  // }

  static Future<void> initializeSupabase() async {
    // Added Future<void> for proper async
    _supabase = await Supabase.initialize(
      url: Constants.kSupabaseUrl,
      anonKey: Constants.kSupabaseAnonKey,
    );
  }

  static Future<String?> uploadImage(File file, String path) async {
    try {
      String fileName = b.basename(file.path);

      // Upload the file
      await _supabase.client.storage
          .from(Constants.kProfileImageBucket)
          .upload('$path/$fileName', file); // Fixed: removed extra dot

      // Get public URL
      final String publicUrl = _supabase.client.storage
          .from(Constants.kProfileImageBucket)
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
        .from(Constants.kProfileImageBucket)
        .getPublicUrl(path);
  }

  // Method to delete image
  static Future<void> deleteImage(String path) async {
    try {
      await _supabase.client.storage.from(Constants.kProfileImageBucket).remove(
        [path],
      );
      log('Image deleted successfully');
    } catch (error) {
      log('Error deleting image: $error');
      rethrow;
    }
  }
}

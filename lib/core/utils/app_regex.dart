import 'package:get/get_utils/src/get_utils/get_utils.dart';

class AppRegex {
  // Super simple email regex that works
  static final RegExp email = RegExp(r'^.+@.+\..+$');

  // Phone number: exactly 11 digits (no spaces or special chars)
  static final RegExp phone = RegExp(r'^\d{11}$');

  // Birthday: DD/MM/YYYY or DD-MM-YYYY
  static final RegExp birthday = RegExp(r'^\d{2}[\/\-]\d{2}[\/\-]\d{4}$');

  static bool isValidEmail(String input) {
    // Use GetUtils instead for better compatibility
    return GetUtils.isEmail(input.trim());
  }

  static bool isValidPhone(String input) {
    String cleaned = input.trim().replaceAll(RegExp(r'[^\d]'), '');
    return cleaned.length == 11 && RegExp(r'^\d{11}$').hasMatch(cleaned);
  }

  static bool isValidBirthday(String input) {
    return birthday.hasMatch(input.trim());
  }
}

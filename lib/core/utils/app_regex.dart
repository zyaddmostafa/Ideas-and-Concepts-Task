class AppRegex {
  // Email regex: basic RFC 5322 compliant
  static final RegExp email = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}\$');

  // Phone number: exactly 11 digits
  static final RegExp phone = RegExp(r'^\d{11}\$');

  // Birthday: DD/MM/YYYY or DD-MM-YYYY (01/01/2000)
  static final RegExp birthday = RegExp(
    r'^(0[1-9]|[12][0-9]|3[01])[\/\-](0[1-9]|1[0-2])[\/\-](19|20)\d\d',
  );

  static bool isValidEmail(String input) => email.hasMatch(input);
  static bool isValidPhone(String input) => phone.hasMatch(input);
  static bool isValidBirthday(String input) => birthday.hasMatch(input);
}

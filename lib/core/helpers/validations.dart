import 'package:easy_localization/easy_localization.dart';

class Validations {
  // static String? validatePassword(String? value) {
  //   // Define the regular expression
  //   String pattern = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$";
  //   RegExp regExp = RegExp(pattern);
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter a password';
  //   } else if (!regExp.hasMatch(value)) {
  //     return "Password must be ".tr();
  //   }
  //   return null;
  // }
  static String? validatePhoneNumber(String? value) {
    String pattern = r'^\d{7,14}$';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number'.tr();
    } else if (!regExp.hasMatch(value.trim())) {
      return 'Phone number is not valid'.tr();
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your email'.tr();
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value.trim())) {
      return 'Please enter a valid email'.tr();
    }
    return null;
  }

  // static String? validateArName(String? value) {
  //   if (value!.isEmpty) {
  //     return "Please enter your name in Arabic".tr();
  //   }
  //   if (!RegExp(r'^(?=.*[\u0621-\u064A]{3})[\u0621-\u064A\s]+$')
  //       .hasMatch(value)) {
  //     return "Please enter your name in Arabic".tr();
  //   }
  //   return null;
  // }
  static String? validateName(String? value) {
    if (value!.isEmpty) {
      return "Please enter your name".tr();
    }
    if (!RegExp("[a-z A-Z]").hasMatch(value.trim())) {
      return "Please enter your name".tr();
    }
    return null;
  }
  //=======================================================

  static String? validateAddress(String? value) {
    if (value!.isEmpty) {
      return "Please enter your address".tr();
    }
    if (!RegExp(r'^(?=(?:.*[a-zA-Z\u0621-\u064A]){3})[a-zA-Z\u0621-\u064A0-9\u0660-\u0669\s,.-]+$')
        .hasMatch(value.trim())) {
      return "Please enter your address".tr();
    }
    return null;
  }

  //=======================================================
  static bool hasMinLength(String? value, {int minLength = 1}) {
    if (value == null) return false;
    return value.trim().length >= minLength;
  }
  //=======================================================

  //email
  static bool isEmail(String? value) {
    if (value == null) return false;
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
  }

  //=======================================================

  static String? isEmailOrPhone(String? value) {
    if (value == null || value.isEmpty) {
      return "This field can't be empty".tr();
    }
    if (value.contains('@') || RegExp("[a-zA-Z]").hasMatch(value)) {
      if (!Validations.isEmail(value.trim())) {
        return "Enter a valid email".tr();
      }
    } else if (value.startsWith("+")) {
      if (!Validations.isPhoneNumber(value.trim())) {
        return "Enter a valid phone number".tr();
      }
    } else {
      return "Phone number must start with +".tr();
    }

    return null;
  }
  //=======================================================

  //password
  static bool isPassword(String? value) {
    if (value == null) return false;
    return value.trim().length >= 6;
  }
  //=======================================================

  //phone
  static bool isPhoneNumber(String? value) {
    if (value == null) return false;
    return RegExp(r'^\+(?:[0-9] ?){6,14}[0-9]$').hasMatch(value.trim());
  }

// validate password
  static String? validatePassword(String password) {
    final regex = RegExp(r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\S+$).{8,}$');
    if (!regex.hasMatch(password)) {
      return 'Password must contain at least one digit,\n one lowercase letter, \n one uppercase letter, \n no spaces, \n and be at least 8 characters long.';
    }
    return null;
  }

  static String? passwordValidate(List<bool> conditions) {
    if (!conditions[0]) {
      return "Password must be at least 8 characters long.".tr();
    }
    if (!conditions[1]) {
      return "Password must contain at least one uppercase letter.".tr();
    }
    if (!conditions[2]) {
      return "Password must contain at least one lowercase letter.".tr();
    }
    if (!conditions[3]) {
      return "Password must contain at least one number.".tr();
    }
    if (!conditions[4]) {
      return "Password must not contain spaces.".tr();
    }
    return null;
  }

  static bool isArabic(String text) {
    if (text.isEmpty) return false;
    return RegExp(r'^[\u0600-\u06FF\u0750-\u077F]').hasMatch(text.trim());
  }
}

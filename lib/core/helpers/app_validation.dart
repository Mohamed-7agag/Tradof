import 'package:flutter/material.dart';

import '../utils/widgets/custom_toastification.dart';
import 'app_regex.dart';
import 'extensions.dart';

class AppValidation {
  static bool passwordValidation(BuildContext context, String password) {
    if (!AppRegex.hasMinLength(password)) {
      errorToast(
        context,
        'Invalid Password',
        'Password must be at least 6 characters long',
      );
      return false;
    } else if (!AppRegex.hasLowerCase(password)) {
      errorToast(
        context,
        'Invalid Password',
        'Password must contain at least one lowercase letter',
      );
      return false;
    } else if (!AppRegex.hasUpperCase(password)) {
      errorToast(
        context,
        'Invalid Password',
        'Password must contain at least one uppercase letter',
      );
      return false;
    } else if (!AppRegex.hasNumber(password)) {
      errorToast(
        context,
        'Invalid Password',
        'Password must contain at least one number digit',
      );
      return false;
    } else if (!AppRegex.hasSpecialCharacter(password)) {
      errorToast(
        context,
        'Invalid Password',
        'Password must contain at least one special character',
      );
      return false;
    }
    return true; // Password is valid
  }

  static bool emailValidation(BuildContext context, String email) {
    if (!AppRegex.isEmailValid(email)) {
      errorToast(context, 'Invalid Email', 'Please enter a valid email');
      return false;
    }
    return true;
  }

  static bool phoneNumberValidation(BuildContext context, String phoneNumber) {
    if (phoneNumber.isNullOrEmpty()) {
      errorToast(
        context,
        'Invalid Phone Number',
        'Please enter a valid phone number',
      );
      return false;
    }
    return true;
  }
}

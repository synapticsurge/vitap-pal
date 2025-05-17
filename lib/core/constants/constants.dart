import 'package:flutter/material.dart';

class VtopMsgConstants {
  static final invalidCredsNameMsg = [
    "Invalid Username/Password".toLowerCase(),
    "Invalid LoginId/Password".toLowerCase(),
  ];
}

class StorageKeys {
  static const vtopUsername = 'VTOP_USERNAME';
  static const vtopPassword = 'VTOP_PASSWORD';
  static const selectedSem = 'SELECTED_SEM';
  static const isValid = 'IS_VALID';
}

class AppColors {
  static const primary = Color.fromARGB(255, 67, 81, 233);
  static const secondary = Color(0xFFFF4D4D);
  static const green = Color.fromARGB(255, 67, 233, 86);
  static const tertiary = Color(0xFF5F5F5F);
  static const backgroundLight = Color(0xFFF5F5F5);
  static const backgroundDark = Color.fromARGB(255, 0, 0, 0);
  static const foregroundColor = Colors.white;
  static const accentColor = Color(0xFF4CAF50);
  static const errorColor = Color(0xFFB71C1C);
  static const disabledColor = Color(0xFFBDBDBD);
  static const textColor = Color(0xFF212121);
  static const textSecondary = Color(0xFF757575);
  static const stext = Color.fromARGB(255, 255, 120, 120);
  static const ptext = Color.fromARGB(255, 255, 253, 120);
  static const red = Color(0xFFFF4D4D);
}

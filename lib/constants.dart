import 'package:flutter/material.dart';

class VtopMsgConstants {
  static const invalidCredsNameMsg = "Invalid Username/Password";
}

class StorageKeys {
  static const vtopUsername = 'VTOP_USERNAME';
  static const vtopPassword = 'VTOP_PASSWORD';
  static const selectedSem = 'SELECTED_SEM';
  static const isValid = 'IS_VALID';
}

// class AppColors {
//   static const primary = Color(0xFF5F7FFF); // Steel Blue (muted blue)
//   static const secondary = Color(0xFFFF6B6B); // Light Gray
//   static const tertiary = Color.fromARGB(255, 245, 124, 0); // Orange (for accents and highlights)
//   static const backgroundDark = Color.fromARGB(255, 15, 15, 15); // Very dark background
//   static const backgroundDark = Color.fromARGB(250, 16, 16, 16);
//   static const backgroundcards = Color.fromARGB(255, 88, 101, 242);
//   static const foregroundColor = Colors.white; // Main text color (white)
//   static const accentColor = Color.fromARGB(255, 255, 193, 7); // Bright Yellow (for highlights or buttons)
//   static const errorColor = Color.fromARGB(255, 239, 83, 80); // Soft Red (for error messages)
//   static const successColor = Color.fromARGB(255, 76, 175, 80); // Soft Green (for success messages)
//   static const disabledColor = Color.fromARGB(255, 158, 158, 158); // Light Gray for disabled elements
//   static const textColor = Color.fromARGB(255, 238, 238, 238); // Soft off-white for text
//   static const textSecondary = Color.fromARGB(255, 189, 189, 189); // Slightly muted secondary text
// }

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
}

class DBsemtable {
  static const semIDTable = "semID_table";
  static const semIDrow = 'semID';
  static const semNamerow = 'semName';
}

class DBtimetable {
  static const timetabelTable = "timetable_table";
  static const serialrow = "serial";
  static const dayrow = "day";
  static const slotrow = "slot";
  static const courseCoderow = "courseCode";
  static const courseTyperow = "courseType";
  static const roomNorow = "roomNo";
  static const blockrow = "block";
  static const startTimerow = "startTime";
  static const endTimerow = "endTime";
  static const semIdrow = "semId";
  static const timeRow = "update_time";
  static const courseName = "name";
}

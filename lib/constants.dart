import 'dart:ui';

class VtopMsgConstants {
  static const invalidCredsNameMsg = "Invalid Username/Password";
}

class StorageKeys {
  static const vtopUsername = 'VTOP_USERNAME';
  static const vtopPassword = 'VTOP_PASSWORD';
  static const isValid = 'IS_VALID';
}

class AppColors {
  static const primary = Color(0xFF5F7FFF);
  static const secondary = Color(0xFFFF6B6B);
  static const tertiary = Color(0xFFFFD700);
  static const backgroundblack = Color.fromARGB(250, 12, 12, 12);
  static const backgroundblack2 = Color.fromARGB(240, 12, 12, 12);
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
}

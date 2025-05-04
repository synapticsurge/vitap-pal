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

class DBattendance {
  static const table = "attendance_table";
  static const serialRow = "serial";
  static const categoryRow = "category";
  static const courseNameRow = "courseName";
  static const courseTypeRow = "courseType";
  static const facultyDetailRow = "facultyDetail";
  static const classesAttendedRow = "classesAttended";
  static const totalClassesRow = "totalClasses";
  static const attendancePercentageRow = "attendancePercentage";
  static const attendenceFatCatRow = "attendenceFatCat";
  static const debarStatusRow = "debarStatus";
  static const slotRow = "slot";
  static const classidRow = "courseCode";
  static const semIdRow = "semId";
  static const timeRow = "update_time";
  static const courseIdRow = "courseIdRow";
}

class DBfullattendance {
  static const table = "fullattendance_table";
  static const serialRow = "serial";
  static const dateRow = "date";
  static const slotRow = "slot";
  static const dayTimeRow = "dayTime";
  static const statusRow = "status";
  static const remarkRow = "remark";
  static const semIdRow = "semId";
  static const timeRow = "update_time";
  static const courseIdRow = "courseIdRow";
  static const courseTypeRow = "courseType";
}

class DBmarks {
  static const table = "marks_table";
  static const serialRow = "serial";
  static const coursecodeRow = "coursecode";
  static const coursetitleRow = "coursetitle";
  static const coursetypeRow = "coursetype";
  static const faculityRow = "faculity";
  static const slotRow = "slot";
  static const marksRow = "marks";
  static const semIdRow = "semId";
  static const timeRow = "update_time";
}

class DBschedule {
  static const table = "schedule_table";
  static const serialRow = "serial";
  static const slotRow = "slot";
  static const courseNameRow = "courseName";
  static const courseCodeRow = "courseCode";
  static const courseTypeRow = "courseType";
  static const courseIdRow = "courseId";
  static const examDateRow = "examDate";
  static const examSessionRow = "examSession";
  static const reportingTimeRow = "reportingTime";
  static const examTimeRow = "examTime";
  static const venueRow = "venue";
  static const seatLocationRow = "seatLocation";
  static const seatNoRow = "seatNo";
  static const examtypeRow = "examtype";
  static const semIdRow = "semId";
  static const timeRow = "update_time";
}

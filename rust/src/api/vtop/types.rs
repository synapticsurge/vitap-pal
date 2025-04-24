
pub struct RAtCourse {
    pub serial: String,
    pub  category: String,
    pub  course_name: String,
    pub course_code: String,
    pub course_type: String,
    pub faculty_detail: String,
    pub classes_attended: String,
    pub total_classes: String,
    pub  attendance_percentage: String,
    pub  attendence_fat_cat: String,
    pub  debar_status: String,
    pub  course_id: String,
}

pub struct RAttendanceList {
  pub  serial: String,
  pub date: String,
  pub  slot: String,
  pub  day_time: String,
  pub  status: String,
  pub  remark: String,
}

pub struct RTimetable {
  pub  serial: String,
 pub   day: String,
 pub   slot: String,
 pub   course_code: String,
 pub   course_type: String,
  pub  room_no: String,
  pub  block: String,
pub    start_time: String,
  pub  end_time: String,
}


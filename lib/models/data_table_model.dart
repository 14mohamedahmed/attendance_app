class DataTableModel {
  List<Results> results;
  DataTableModel({this.results});

  DataTableModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = toListofResults(json['results']);
    }
  }
  static List<Results> toListofResults(List<dynamic> list) {
    List<Results> results = list.map((e) => Results.fromJson(e)).toList();
    return results;
  }
}

class Results {
  String attendanceDate;
  String attendanceTime;
  List<AttendanceType> attendanceType;

  Results.fromJson(Map<String, dynamic> json) {
    attendanceDate = json['attendance_date'];
    attendanceTime = json['attendance_time'];
    if (json['attendanceType'] != null) {
      attendanceType = toListofAttendanceType(json['attendanceType']);
    }
  }
  static List<AttendanceType> toListofAttendanceType(List<dynamic> list) {
    List<AttendanceType> attendanceList =
        list.map((e) => AttendanceType.fromJson(e)).toList();
    return attendanceList;
  }
}

class AttendanceType {
  bool checkIn;
  bool checkOut;

  AttendanceType.fromJson(Map<String, dynamic> json) {
    checkIn = json['check-in'];
    checkOut = json['check-out'];
  }
}

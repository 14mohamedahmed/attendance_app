class DataTableModel {
  List<Results> results;

  DataTableModel({this.results});

  DataTableModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String attendanceDate;
  String attendanceTime;
  List<AttendanceType> attendanceType;

  Results({this.attendanceDate, this.attendanceTime, this.attendanceType});

  Results.fromJson(Map<String, dynamic> json) {
    attendanceDate = json['attendance_date'];
    attendanceTime = json['attendance_time'];
    if (json['attendanceType'] != null) {
      attendanceType = new List<AttendanceType>();
      json['attendanceType'].forEach((v) {
        attendanceType.add(new AttendanceType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attendance_date'] = this.attendanceDate;
    data['attendance_time'] = this.attendanceTime;
    if (this.attendanceType != null) {
      data['attendanceType'] =
          this.attendanceType.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AttendanceType {
  bool checkIn;
  bool checkOut;

  AttendanceType({this.checkIn, this.checkOut});

  AttendanceType.fromJson(Map<String, dynamic> json) {
    checkIn = json['check-in'];
    checkOut = json['check-out'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['check-in'] = this.checkIn;
    data['check-out'] = this.checkOut;
    return data;
  }
}

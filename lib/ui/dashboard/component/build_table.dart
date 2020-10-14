import 'package:attendance_app/appConfig/app_config.dart';
import 'package:attendance_app/models/data_table_model.dart';
import 'package:attendance_app/ui/dashboard/component/build_column_table.dart';
import 'package:flutter/material.dart';

class BuildTable extends StatelessWidget {
  final List<Results> results;
  BuildTable({this.results});
  @override
  Widget build(BuildContext context) {
    AppConfig().init(context);
    final columnTextStyle = TextStyle(
        fontSize: AppConfig.blockSizeVertical * 2.5,
        fontWeight: FontWeight.bold);
    final rowTextStyle = TextStyle(
      fontSize: AppConfig.blockSizeVertical * 2.5,
    );
    final attendedTimeLeave = TextStyle(
      color: Colors.black,
      fontSize: AppConfig.blockSizeVertical * 2.5,
    );
    final attendedCheckFalse = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowGlow();
        return null;
      },
      child: Scrollbar(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: DataTable(
                  columnSpacing: 20,
                  dividerThickness: 2,
                  columns: [
                    DataColumn(
                      label: Text('Attendance Data',
                          style: columnTextStyle, textAlign: TextAlign.center),
                    ),
                    DataColumn(
                      label: BuildColumnTable(
                        headText: 'Time to',
                        subTextL: 'Attend',
                        subTextR: 'Leave',
                        columnTextStyle: columnTextStyle,
                      ),
                    ),
                    DataColumn(
                      label: BuildColumnTable(
                        headText: 'Attendance Type',
                        subTextL: 'check-in',
                        subTextR: 'check-out',
                        columnTextStyle: columnTextStyle,
                      ),
                    ),
                  ],
                  rows: results
                      .map(
                        (data) => DataRow(
                          cells: [
                            DataCell(
                              Center(
                                child: Text(data.attendanceDate,
                                    style: rowTextStyle),
                              ),
                            ),
                            DataCell(
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Center(
                                    child: Text(
                                      data.attendTime == ''
                                          ? '____'
                                          : data.attendTime,
                                      style: data.attendTime == ''
                                          ? attendedCheckFalse
                                          : attendedTimeLeave,
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      data.leaveTime == ''
                                          ? '____'
                                          : data.leaveTime,
                                      style: data.leaveTime == ''
                                          ? attendedCheckFalse
                                          : attendedTimeLeave,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            DataCell(
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  data.attendanceType[0].checkIn == true
                                      ? Center(
                                          child: Icon(
                                            Icons.done,
                                            color:
                                                Theme.of(context).accentColor,
                                          ),
                                        )
                                      : Center(
                                          child: Text(
                                            '____',
                                            style: attendedCheckFalse,
                                          ),
                                        ),
                                  data.attendanceType[0].checkOut == true
                                      ? Center(
                                          child: Icon(
                                            Icons.done,
                                            color:
                                                Theme.of(context).accentColor,
                                          ),
                                        )
                                      : Center(
                                          child: Text(
                                            '____',
                                            style: attendedCheckFalse,
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    // style of same widgets
  }
}

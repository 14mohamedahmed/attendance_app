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
      color: Color(0xFFF2769A),
      fontSize: AppConfig.safeBlockVertical * 2.5,
      fontWeight: FontWeight.bold,
    );
    final rowTextStyle = Theme.of(context)
        .textTheme
        .headline3
        .copyWith(fontSize: AppConfig.safeBlockVertical * 2.5);
    final attendedTimeLeave = Theme.of(context)
        .textTheme
        .headline3
        .copyWith(fontSize: AppConfig.safeBlockVertical * 2.5);
    final attendedCheckFalse = Theme.of(context).textTheme.headline3.copyWith(
          fontSize: AppConfig.safeBlockVertical * 2.5,
          fontWeight: FontWeight.bold,
        );
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowGlow();
        return null;
      },
      child: Scrollbar(
        thickness: 1.5,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Scrollbar(
            thickness: 1.5,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Color(0xFFF2769A)),
                  child: DataTable(
                    columnSpacing: AppConfig.safeBlockVertical * 4,
                    dividerThickness: 1,
                    columns: [
                      DataColumn(
                        label: Text('Attendance Data',
                            style: columnTextStyle,
                            textAlign: TextAlign.center),
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
                          headText: 'Check Attendance',
                          subTextL: 'In',
                          subTextR: 'Out',
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
                                            child: Icon(
                                              Icons.cancel,
                                              color: Colors.red,
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
                                            child: Icon(
                                              Icons.cancel,
                                              color: Colors.red,
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
      ),
    );
    // style of same widgets
  }
}

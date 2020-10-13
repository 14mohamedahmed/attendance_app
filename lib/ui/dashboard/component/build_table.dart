import 'package:attendance_app/appConfig/app_config.dart';
import 'package:attendance_app/models/data_table_model.dart';
import 'package:flutter/material.dart';

class BuildTable extends StatelessWidget {
  final List<Results> results;
  BuildTable({this.results});
  @override
  Widget build(BuildContext context) {
    AppConfig().init(context);
    var columnTextStyle = TextStyle(
        fontSize: AppConfig.blockSizeVertical * 2.5,
        fontWeight: FontWeight.bold);
    var rowTextStyle = TextStyle(
      fontSize: AppConfig.blockSizeVertical * 2.5,
    );
    var attendedCheckFalse = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
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
                label: Text('Attendance time',
                    style: columnTextStyle, textAlign: TextAlign.center),
              ),
              DataColumn(
                  label: Container(
                height: 40,
                width: 180,
                child: Column(
                  children: [
                    Text('Attendance Type',
                        style: columnTextStyle, textAlign: TextAlign.center),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('check-in',
                            style: columnTextStyle,
                            textAlign: TextAlign.center),
                        Text('check-out',
                            style: columnTextStyle,
                            textAlign: TextAlign.center),
                      ],
                    )
                  ],
                ),
              )),
            ],
            rows: results
                .map(
                  (data) => DataRow(
                    cells: [
                      DataCell(
                        Center(
                          child: Text(data.attendanceDate, style: rowTextStyle),
                        ),
                      ),
                      DataCell(
                        Center(
                            child:
                                Text(data.attendanceTime, style: rowTextStyle)),
                      ),
                      DataCell(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            data.attendanceType[0].checkIn == true
                                ? Center(
                                    child: Icon(
                                      Icons.done,
                                      color: Theme.of(context).accentColor,
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
                                      color: Theme.of(context).accentColor,
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
    );
    // style of same widgets
  }
}

import 'package:attendance_app/appConfig/app_config.dart';
import 'package:flutter/material.dart';

class BuildColumnTable extends StatelessWidget {
  final String headText;
  final String subTextL;
  final String subTextR;

  const BuildColumnTable({
    @required this.headText,
    @required this.subTextL,
    @required this.subTextR,
  });
  @override
  Widget build(BuildContext context) {
    AppConfig().init(context);
    return Container(
      width: AppConfig.screenWidth * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(headText, textAlign: TextAlign.center),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(subTextL, textAlign: TextAlign.center),
              Text(subTextR, textAlign: TextAlign.center),
            ],
          )
        ],
      ),
    );
  }
}

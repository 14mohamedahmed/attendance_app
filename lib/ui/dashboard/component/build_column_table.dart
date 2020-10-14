import 'package:flutter/material.dart';

class BuildColumnTable extends StatelessWidget {
  final String headText;
  final String subTextL;
  final String subTextR;
  final TextStyle columnTextStyle;

  const BuildColumnTable({
    @required this.headText,
    @required this.subTextL,
    @required this.subTextR,
    @required this.columnTextStyle,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 180,
      child: Column(
        children: [
          Text(headText, style: columnTextStyle, textAlign: TextAlign.center),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(subTextL,
                  style: columnTextStyle, textAlign: TextAlign.center),
              Text(subTextR,
                  style: columnTextStyle, textAlign: TextAlign.center),
            ],
          )
        ],
      ),
    );
  }
}

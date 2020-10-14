import 'dart:io';

import 'package:attendance_app/provider/dashboard_provider.dart';
import 'package:attendance_app/ui/dashboard/component/build_bottom_sheet.dart';
import 'package:attendance_app/ui/dashboard/component/build_drawer.dart';
import 'package:attendance_app/ui/dashboard/component/build_table.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  static final String routeName = '/dashboard';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  File _pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        title: Text(
          'Dashboard',
          style: TextStyle(color: Color(0xFFFD6C6E), letterSpacing: 2),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
        actions: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.black.withOpacity(0.8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                context: context,
                builder: (builder) => BuildBottomSheet(
                  getImage: (value) {
                    setState(() {
                      _pickedImage = value;
                    });
                  },
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: CircleAvatar(
                backgroundColor: Theme.of(context).accentColor,
                backgroundImage: _pickedImage == null
                    ? AssetImage('assets/images/profile_pic.png')
                    : FileImage(_pickedImage),
                radius: 40,
              ),
            ),
          ),
        ],
      ),
      drawer: BuildDrawer(),
      body: Consumer<DashboardProvider>(
        builder: (context, provider, child) {
          if (provider.getTabelData == null) {
            provider.getData(context);
            return Center(child: CircularProgressIndicator());
          }
          return BuildTable(results: provider.getTabelData.results);
        },
      ),
    );
  }
}

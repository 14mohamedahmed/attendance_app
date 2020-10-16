import 'dart:io';

import 'package:attendance_app/provider/dashboard_provider.dart';
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
  DashboardProvider _dashboardProvider;
  var _imagePath;
  @override
  void initState() {
    _dashboardProvider = Provider.of<DashboardProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _dashboardProvider.getUserInfoPreference(key: 'imagePicked').then((value) {
      setState(() {
        _imagePath = value;
      });
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        elevation: 0,
        title: Text(
          'Dashboard',
          style: TextStyle(color: Color(0xFFFD6C6E), letterSpacing: 2),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
        actions: [
          GestureDetector(
            onTap: () {
              //nothing to do for now
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: _imagePath == null
                        ? AssetImage('assets/images/profile_pic.png')
                        : FileImage(File(_imagePath)),
                    fit: BoxFit.cover,
                  ),
                ),
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

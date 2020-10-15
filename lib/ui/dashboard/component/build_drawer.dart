import 'dart:io';

import 'package:attendance_app/appConfig/app_config.dart';
import 'package:attendance_app/provider/dashboard_provider.dart';
import 'package:attendance_app/ui/auth/auth_screen.dart';
import 'package:attendance_app/ui/dashboard/component/build_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildDrawer extends StatefulWidget {
  @override
  _BuildDrawerState createState() => _BuildDrawerState();
}

class _BuildDrawerState extends State<BuildDrawer> {
  var _imagePath;
  DashboardProvider _dashboardProvider;
  @override
  void initState() {
    _dashboardProvider = Provider.of<DashboardProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _dashboardProvider.getUserImage(key: 'imagePicked').then((value) {
      setState(() {
        _imagePath = value;
      });
    });
    AppConfig().init(context);
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            color: Theme.of(context).accentColor,
            height: MediaQuery.of(context).size.height * 0.2,
            padding: EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: _imagePath == null
                          ? AssetImage('assets/images/profile_pic.png')
                          : FileImage(File(_imagePath)),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'UserEmail',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppConfig.blockSizeVertical * 3),
                    ),
                    SizedBox(height: 2),
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
                          builder: (builder) => BuildBottomSheet(),
                        );
                      },
                      child: Text(
                        'Change Profile',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue.shade800,
                            fontSize: AppConfig.blockSizeVertical * 2),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          drawerField(
            onTap: () {
              // Navigator.of(context).pop();
              // Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
            },
            title: 'Setting',
            icon: Icons.settings,
            context: context,
          ),
          Divider(
            color: Colors.grey[900],
          ),
          drawerField(
            onTap: () {
              // Navigator.of(context).pop();
              // Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
            },
            title: 'About App',
            icon: Icons.phone_android,
            context: context,
          ),
          Divider(
            color: Colors.grey[900],
          ),
          drawerField(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
            },
            title: 'Sign Up',
            icon: Icons.exit_to_app,
            context: context,
          ),
          Divider(
            color: Colors.grey[900],
          ),
        ],
      ),
    );
  }

  Widget drawerField(
      {@required Function onTap,
      @required String title,
      @required IconData icon,
      @required BuildContext context}) {
    AppConfig().init(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(
            vertical: AppConfig.blockSizeVertical * 2,
            horizontal: AppConfig.blockSizeHorizontal * 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: AppConfig.blockSizeVertical * 2.5,
              ),
            ),
            Icon(
              icon,
              size: AppConfig.blockSizeVertical * 4.5,
              color: Colors.deepPurpleAccent,
            ),
          ],
        ),
      ),
    );
  }
}

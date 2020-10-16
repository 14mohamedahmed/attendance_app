import 'dart:io';

import 'package:attendance_app/appConfig/app_config.dart';
import 'package:attendance_app/provider/dashboard_provider.dart';
import 'package:attendance_app/ui/auth/auth_screen.dart';
import 'package:attendance_app/ui/dashboard/component/build_alet_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildDrawer extends StatefulWidget {
  @override
  _BuildDrawerState createState() => _BuildDrawerState();
}

class _BuildDrawerState extends State<BuildDrawer> {
  var _imagePath;
  var _userEmail;
  DashboardProvider _dashboardProvider;
  @override
  void initState() {
    _dashboardProvider = Provider.of<DashboardProvider>(context, listen: false);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final mouleRoute =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    _userEmail = mouleRoute['email'];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _dashboardProvider.getUserInfoPreference(key: 'imagePicked').then((value) {
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 180,
                      child: Text(
                        _userEmail,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: AppConfig.blockSizeVertical * 2.5),
                      ),
                    ),
                    SizedBox(height: 2),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            title: Text(
                              'Choose',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: AppConfig.blockSizeVertical * 3,
                              ),
                            ),
                            content: BuildAlertDialog(),
                          ),
                        ).then((value) => Navigator.of(context).pop());
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
              color: Theme.of(context).accentColor,
            ),
          ],
        ),
      ),
    );
  }
}

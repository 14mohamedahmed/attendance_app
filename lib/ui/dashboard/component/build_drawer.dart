import 'dart:io';

import 'package:attendance_app/appConfig/app_config.dart';
import 'package:attendance_app/provider/auth_provider.dart';
import 'package:attendance_app/provider/dashboard_provider.dart';
import 'package:attendance_app/ui/about_app/about_app.dart';
import 'package:attendance_app/ui/auth/auth_screen.dart';
import 'package:attendance_app/ui/dashboard/component/build_alet_dialog.dart';
import 'package:attendance_app/ui/setting/setting_screen.dart';
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
  AuthProvider _authProvider;
  @override
  void initState() {
    _dashboardProvider = Provider.of<DashboardProvider>(context, listen: false);
    _authProvider = Provider.of<AuthProvider>(context, listen: false);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _dashboardProvider.getUserImagePreference(key: 'imagePicked').then((value) {
      setState(() {
        _imagePath = value;
      });
    });
    _authProvider.getUserDataPreference(key: 'email').then((value) {
      setState(() {
        _userEmail = value;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    AppConfig().init(context);
    return Drawer(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                color: Theme.of(context).accentColor,
                height: AppConfig.safeBlockVertical * 20,
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: _changeProfile,
                      child: Container(
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
                    ),
                    SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 180,
                          child: Text(
                            _userEmail ?? 'Loading....',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: AppConfig.safeBlockVertical * 2.5),
                          ),
                        ),
                        SizedBox(height: 2),
                        GestureDetector(
                          onTap: _changeProfile,
                          child: Text(
                            'Change Profile',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blue.shade800,
                                fontSize: AppConfig.safeBlockVertical * 2),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              drawerField(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(SettingScreen.routeName);
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
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(AboutApp.routeName);
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
                  Navigator.of(context)
                      .pushReplacementNamed(AuthScreen.routeName);
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
        ),
      ),
    );
  }

  void _changeProfile() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        title: Text(
          'Choose',
          style: TextStyle(
            color: Colors.black,
            fontSize: AppConfig.safeBlockVertical * 3,
          ),
        ),
        content: BuildAlertDialog(),
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
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: EdgeInsets.symmetric(
            vertical: AppConfig.safeBlockVertical * 2,
            horizontal: AppConfig.safeBlockHorizontal * 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline3.copyWith(
                    fontSize: AppConfig.safeBlockVertical * 3,
                  ),
            ),
            Icon(
              icon,
              size: AppConfig.safeBlockVertical * 4.5,
              color: Theme.of(context).accentColor,
            ),
          ],
        ),
      ),
    );
  }
}

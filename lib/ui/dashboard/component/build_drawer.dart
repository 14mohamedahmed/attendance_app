import 'package:attendance_app/appConfig/app_config.dart';
import 'package:attendance_app/ui/auth/auth_screen.dart';
import 'package:flutter/material.dart';

class BuildDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppConfig().init(context);
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).accentColor,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Center(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/images/profile_pic.png'),
                  radius: 30,
                ),
                title: Text(
                  'UserEmail',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: AppConfig.blockSizeVertical * 3),
                ),
              ),
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

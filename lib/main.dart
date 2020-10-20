import 'package:attendance_app/provider/auth_provider.dart';
import 'package:attendance_app/provider/dashboard_provider.dart';
import 'package:attendance_app/provider/theme_provider.dart';
import 'package:attendance_app/ui/about_app/about_app.dart';
import 'package:attendance_app/ui/auth/auth_screen.dart';
import 'package:attendance_app/ui/dashboard/dashboard_screen.dart';
import 'package:attendance_app/ui/setting/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

var _userEmail;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  _userEmail = prefs.getString('email');
  // Listen to dark theme
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(true),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xFFFD6C6E)));
    return MultiProvider(
      // intilaize all providers files here
      // there is other way ==> remove multi provider then intialize every provider file above every screen
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DashboardProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Attendance App',
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeProvider>(context).getTheme(context),
        initialRoute: _userEmail == '' || _userEmail == null
            ? AuthScreen.routeName
            : DashboardScreen.routeName,
        routes: {
          AuthScreen.routeName: (context) => AuthScreen(),
          DashboardScreen.routeName: (context) => DashboardScreen(),
          SettingScreen.routeName: (context) => SettingScreen(),
          AboutApp.routeName: (context) => AboutApp(),
        },
      ),
    );
  }
}

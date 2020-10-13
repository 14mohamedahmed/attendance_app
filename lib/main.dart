import 'package:attendance_app/ui/auth/auth_screen.dart';
import 'package:attendance_app/ui/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xFFFD6C6E)));
    return MaterialApp(
      title: 'Attendance App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFF2769A),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        hintColor: Colors.white,
        accentColor: Color(0xFFFD6C6E),
      ),
      initialRoute: AuthScreen.routeName,
      routes: {
        AuthScreen.routeName: (context) => AuthScreen(),
        DashboardScreen.routeName: (context) => DashboardScreen(),
      },
    );
  }
}

import 'package:attendance_app/appConfig/app_config.dart';
import 'package:attendance_app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutApp extends StatelessWidget {
  static final String routeName = '/aboutApp';
  final String part2 = ' 8Worx ';
  final String part3 =
      '''team by logging in with an account consisting of the company ID, email, and password.
You will be directed to the dashboard page with your attendance and absence dates.''';
  final String part1 =
      '''     This application is a registration of attendance and absence by day and date.
You can use this program if you are a member of the ''';
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    AppConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: themeProvider.getLeadingAppBarIconColor,
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'About Us',
          style: TextStyle(color: Color(0xFFFD6C6E), letterSpacing: 2),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: AppConfig.safeBlockVertical * 3,
            horizontal: AppConfig.safeBlockHorizontal * 3),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(text: part1),
              TextSpan(
                text: part2,
                style: Theme.of(context).textTheme.headline3.copyWith(
                      fontSize: AppConfig.safeBlockVertical * 3,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              TextSpan(text: part3),
            ],
            style: Theme.of(context).textTheme.headline3.copyWith(
                  fontSize: AppConfig.safeBlockVertical * 3,
                  color: Colors.grey,
                ),
          ),
        ),
      ),
    );
  }
}

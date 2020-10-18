import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark;
  ThemeProvider(this.isDark);

  //return color
  get getThemebackground => isDark ? Colors.black : Colors.white;
  get getleadingTextFieldColor => isDark ? Colors.yellow : Colors.deepPurple;
  get getLeadingAppBarIconColor => isDark ? Colors.white : Colors.black;
  // return theme of the app
  getTheme(BuildContext context) =>
      isDark ? darkTheme(context) : lightTheme(context);

  //change isDark value
  set setThemeData(bool val) {
    if (val) {
      isDark = true;
    } else {
      isDark = false;
    }
    notifyListeners();
  }
}

// initialize dark theme data
ThemeData darkTheme(BuildContext context) {
  return ThemeData(
    primaryColor: Color(0xFFF2769A),
    scaffoldBackgroundColor: Color(0xFF0A0E21),
    hintColor: Colors.white,
    accentColor: Color(0xFFFD6C6E),
    textTheme: Theme.of(context).textTheme.copyWith(
          headline3: TextStyle(color: Colors.white),
          headline4: TextStyle(color: Colors.white),
          button: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
  );
}

// initialize light theme data
ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    primaryColor: Color(0xFFF2769A),
    scaffoldBackgroundColor: Colors.white,
    hintColor: Colors.black,
    accentColor: Color(0xFFFD6C6E),
    textTheme: Theme.of(context).textTheme.copyWith(
          headline3: TextStyle(color: Colors.black),
          headline4: TextStyle(color: Colors.black),
          button: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
  );
}

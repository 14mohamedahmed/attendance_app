import 'package:attendance_app/packages/implement_plugins/shared_prefs_plugin.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  //import helper classes
  SharedPrefsPlugin _sharedPrefsPlugin = SharedPrefsPlugin();

  // save user log in data locally
  Future<void> setUserDataPreference(
      {@required String key, @required String info}) async {
    return _sharedPrefsPlugin.saveUserInfoPreference(key, info);
  }

  // get user login data
  Future<String> getUserDataPreference({@required String key}) async {
    return _sharedPrefsPlugin.getUserInfoPreference(key);
  }
}

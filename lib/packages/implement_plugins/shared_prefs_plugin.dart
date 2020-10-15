import 'package:attendance_app/packages/abstract/shared_prefs_abstract.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsPlugin implements SharedPrefsAbstract {
  //get user image
  @override
  Future<String> getImagePreference(String key) async {
    SharedPreferences getUserImage = await SharedPreferences.getInstance();
    return getUserImage.getString(key);
  }

  //save user image locally
  @override
  void saveImagePreference(String key, String pickedImage) async {
    SharedPreferences saveUserImage = await SharedPreferences.getInstance();
    saveUserImage.setString(key, pickedImage);
  }
}

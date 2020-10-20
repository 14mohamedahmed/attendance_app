abstract class SharedPrefsAbstract {
  void saveUserInfoPreference(String key, String pickedImage);
  Future<String> getUserInfoPreference(String key);
  void clearInfoPreference(String key);
}

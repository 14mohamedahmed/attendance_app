abstract class SharedPrefsAbstract {
  void saveImagePreference(String key, String pickedImage);
  Future<String> getImagePreference(String key);
}

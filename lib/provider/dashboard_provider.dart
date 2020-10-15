import 'dart:convert';
import 'dart:io';
import 'package:attendance_app/models/data_table_model.dart';
import 'package:attendance_app/packages/implement_plugins/img_picker_plugin.dart';
import 'package:attendance_app/packages/implement_plugins/shared_prefs_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class DashboardProvider extends ChangeNotifier {
  DataTableModel _data;
  DataTableModel get getTabelData => _data;
  ImagePickerPlugin _imagePickerPlugin = ImagePickerPlugin();
  SharedPrefsPlugin _sharedPrefsPlugin = SharedPrefsPlugin();
  // fetch attendance information from json file
  Future getData(context) async {
    final response = await DefaultAssetBundle.of(context)
        .loadString('assets/json/dataTable.json');
    final decodeResponse = json.decode(response);
    _data = DataTableModel.fromJson(decodeResponse);
    notifyListeners();
  }

  // get image from the device or camera and return it
  Future<File> getImagePicker(ImageSource imageSource) async {
    return _imagePickerPlugin.fetchImage(imageSource);
  }

  // save user image locally
  Future<void> setUserInfoPreference(
      {@required String key, @required String info}) async {
    return _sharedPrefsPlugin.saveUserInfoPreference(key, info);
  }

  // get user image
  Future<String> getUserInfoPreference({@required String key}) async {
    return _sharedPrefsPlugin.getUserInfoPreference(key);
  }
}

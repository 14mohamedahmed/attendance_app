import 'dart:convert';
import 'package:attendance_app/models/data_table_model.dart';
import 'package:attendance_app/packages/implement_plugins/img_picker_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class DashboardProvider extends ChangeNotifier {
  DataTableModel _data;
  DataTableModel get getTabelData => _data;
  ImagePickerPlugin imagePickerPlugin = ImagePickerPlugin();

  Future getData(context) async {
    final response = await DefaultAssetBundle.of(context)
        .loadString('assets/json/dataTable.json');
    final decodeResponse = json.decode(response);
    _data = DataTableModel.fromJson(decodeResponse);
    notifyListeners();
  }

  Future<void> getImagePicker(ImageSource imageSource) async {
    return imagePickerPlugin.fetchImage(imageSource);
  }
}

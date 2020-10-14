import 'dart:convert';
import 'dart:io';

import 'package:attendance_app/abstract/img_picker_abstract.dart';
import 'package:attendance_app/models/data_table_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class DashboardProvider extends ChangeNotifier implements ImagePickerAbstract {
  DataTableModel _data;
  DataTableModel get getTabelData => _data;
  File image;
  final _picker = ImagePicker();

  Future getData(context) async {
    final response = await DefaultAssetBundle.of(context)
        .loadString('assets/json/dataTable.json');
    final decodeResponse = json.decode(response);
    _data = DataTableModel.fromJson(decodeResponse);
    notifyListeners();
  }

  @override
  Future<File> getImagePicker(ImageSource imagesource) async {
    final pickedFile = await _picker.getImage(source: imagesource);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
    return image;
  }
}

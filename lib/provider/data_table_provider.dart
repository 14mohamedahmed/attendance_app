import 'dart:convert';

import 'package:attendance_app/models/data_table_model.dart';
import 'package:flutter/cupertino.dart';

class DataTableProvider extends ChangeNotifier {
  DataTableModel _data;
  DataTableModel get getTabelData => _data;
  Future getData(context) async {
    final response = await DefaultAssetBundle.of(context)
        .loadString('assets/json/dataTable.json');
    final decodeResponse = json.decode(response);
    _data = DataTableModel.fromJson(decodeResponse);
    notifyListeners();
  }
}

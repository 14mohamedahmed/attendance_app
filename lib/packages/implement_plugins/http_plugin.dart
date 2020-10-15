import 'dart:convert';
import 'dart:io';
import 'package:attendance_app/packages/abstract/http_abstract.dart';
import 'package:http/http.dart' as h;

class HTTPPlugin implements HTTPAbstract {
  @override
  Future<void> uploadToServer(String endPoint, File image) async {
    String base64encode = base64Encode(image.readAsBytesSync());
    String imageName = image.path.split('/').last;
    await h.post(
      endPoint,
      body: json.encode(
        {
          'image': base64encode,
          'name': imageName,
        },
      ),
    );
  }
}

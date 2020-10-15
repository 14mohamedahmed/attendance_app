import 'dart:io';

import 'package:attendance_app/packages/abstract/img_picker_abstract.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPlugin implements ImagePickerAbstract {
  File _image;
  final _picker = ImagePicker();
  //implement image picker package
  @override
  Future<File> fetchImage(ImageSource imagesource) async {
    final pickedFile = await _picker.getImage(source: imagesource);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
    }
    return _image;
  }
}

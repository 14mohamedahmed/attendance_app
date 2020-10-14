import 'dart:io';
import 'package:image_picker/image_picker.dart';

abstract class ImagePickerAbstract {
  Future<File> getImagePicker(ImageSource imagesource);
}

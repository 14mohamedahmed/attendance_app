import 'dart:io';
import 'package:image_picker/image_picker.dart';

abstract class ImagePickerAbstract {
  Future<File> fetchImage(ImageSource imagesource);
}

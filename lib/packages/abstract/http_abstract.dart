import 'dart:io';

abstract class HTTPAbstract {
  Future<void> uploadToServer(String endPoint, File image);
}

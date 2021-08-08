import 'dart:io';

import 'package:get/get.dart';

class CameraStateController extends GetxController {
  File? _capturedImage;

  File get capturedImage => _capturedImage!;

  void save(File image) {
    _capturedImage = image;
  }
}

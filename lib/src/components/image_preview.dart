import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class ImagePreview extends StatelessWidget {
  const ImagePreview({Key? key, this.imageFile, this.flip = false})
      : super(key: key);

  final File? imageFile;
  final bool flip;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(flip ? math.pi : 0),
      child: Container(
        child: Image.file(
          imageFile!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_story/src/themes/color.dart';

class OverlayLoading extends StatelessWidget {
  const OverlayLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: CircularProgressIndicator(
            color: primaryLightColor,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_story/src/themes/color.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton({
    Key? key,
    this.onPressed,
    this.icon,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: primaryLightColor.withOpacity(0.5),
      onPressed: onPressed,
      icon: icon!,
    );
  }
}

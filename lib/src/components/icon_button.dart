import 'package:flutter/material.dart';
import 'package:my_story/src/themes/color.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton({
    Key? key,
    this.onPressed,
    this.icon,
    this.tooltip,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Widget? icon;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: primaryLightColor.withOpacity(0.5),
      onPressed: onPressed,
      icon: icon!,
      tooltip: tooltip,
    );
  }
}

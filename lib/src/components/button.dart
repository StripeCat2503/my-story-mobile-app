import 'package:flutter/material.dart';
import 'package:my_story/src/themes/color.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    Key? key,
    this.title = '',
    this.color,
    this.textStyle,
    this.filled = true,
    this.loading = false,
    this.prefix,
    this.suffix,
    this.borderRadius = 0,
    this.elevation = 0,
    this.padding,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final Color? color;
  final TextStyle? textStyle;
  final bool filled;
  final bool loading;
  final Widget? prefix;
  final Widget? suffix;
  final double borderRadius;
  final double elevation;
  final EdgeInsets? padding;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RawMaterialButton(
          padding:
              padding ?? EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          elevation: elevation,
          onPressed: onPressed,
          fillColor: filled ? color : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side:
                filled ? BorderSide.none : BorderSide(width: 1, color: color!),
          ),
          splashColor: filled ? blackDarkColor : color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: textStyle,
              ),
            ],
          ),
        ),
        if (prefix != null)
          Positioned(
            left: 15,
            top: 12.5,
            child: prefix as Widget,
          ),
        if (suffix != null)
          Positioned(
            right: 15,
            top: 12.5,
            child: suffix as Widget,
          ),
      ],
    );
  }
}

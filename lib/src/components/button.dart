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
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: onPressed,
          splashColor: filled ? blackDarkColor : color,
          child: Ink(
            color: filled ? primaryColor : Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.fromBorderSide(
                  filled
                      ? BorderSide.none
                      : BorderSide(
                          width: 1,
                          color: color as Color,
                        ),
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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

import 'package:flutter/material.dart';
import 'package:my_story/src/themes/color.dart';

class BaseTextField extends StatelessWidget {
  const BaseTextField({
    Key? key,
    this.placeholder,
    this.prefixIcon,
    this.prefixIconUrl,
    this.prefixIconSize = 12,
    this.prefixIconColor = blackDarkColor,
    this.borderRadius = 0,
    this.borderWidth = 1,
    this.borderColor = blackDarkColor,
    this.outlined = true,
    this.bgColor = blackDarkColor,
    this.textStyle,
    this.placeHolderStyle,
    this.isPasswordField = false,
    this.onChanged,
  }) : super(key: key);

  final String? placeholder;
  final Icon? prefixIcon;
  final String? prefixIconUrl;
  final double prefixIconSize;
  final Color prefixIconColor;
  final double borderRadius;
  final bool outlined;
  final Color bgColor;
  final Color borderColor;
  final double borderWidth;
  final TextStyle? textStyle;
  final TextStyle? placeHolderStyle;
  final bool isPasswordField;
  final Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: placeHolderStyle,
        fillColor: bgColor,
        filled: !outlined,
        border: outlined
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  width: borderWidth,
                  color: borderColor,
                ),
              )
            : InputBorder.none,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar getAppBar({
  bool hasBackAction = true,
  String title = '',
  List<Widget>? actions,
  TextStyle? titleStyle,
}) {
  return AppBar(
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        size: 30,
      ),
      onPressed: () {
        Get.back();
      },
    ),
    title: Text(
      title,
      style: titleStyle,
    ),
    actions: actions,
  );
}

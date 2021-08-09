import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

AppBar getPrimaryAppBar({
  bool hasBackAction = true,
  String title = '',
  List<Widget>? actions,
  TextStyle? titleStyle,
  Color bgColor = Colors.white,
  Color backActionColor = Colors.black,
}) {
  return AppBar(
    backgroundColor: bgColor,
    leading: hasBackAction
        ? IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: backActionColor,
            ),
            onPressed: () {
              Get.back();
            },
          )
        : null,
    title: Text(
      title,
      style: titleStyle,
    ),
    actions: actions,
  );
}

AppBar getAppBar({
  bool hasBackAction = true,
  String title = '',
  Widget? leading,
  List<Widget>? actions,
  TextStyle? titleStyle,
  Color bgColor = Colors.white,
}) {
  return AppBar(
    backgroundColor: bgColor,
    leading: hasBackAction
        ? IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 30,
            ),
            onPressed: () {
              Get.back();
            },
          )
        : leading,
    title: Text(
      title,
      style: titleStyle,
    ),
    actions: actions ??
        [
          Container(
            margin: EdgeInsets.only(
              right: 15,
            ),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('lib/assets/icons/profile.svg'),
              padding: EdgeInsets.all(0),
            ),
          ),
        ],
    automaticallyImplyLeading: false,
  );
}

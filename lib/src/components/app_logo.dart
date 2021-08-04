import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_story/src/config/app.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    Key? key,
    this.logoSize = 87,
    this.textSize = 30,
    this.centerContent = true,
  }) : super(key: key);

  final double logoSize;
  final double textSize;
  final bool centerContent;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          centerContent ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          'lib/assets/images/app/app-logo.svg',
          width: logoSize,
        ),
        SizedBox(
          width: 17,
        ),
        Text(
          appName,
          style: TextStyle(fontFamily: 'TheGirlNextDoor', fontSize: textSize),
        )
      ],
    );
  }
}

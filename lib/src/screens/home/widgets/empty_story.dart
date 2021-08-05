import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_story/src/themes/color.dart';

class EmptyStory extends StatelessWidget {
  const EmptyStory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Opacity(
          child: SvgPicture.asset(
            'lib/assets/images/home_screen/empty_story.svg',
          ),
          opacity: 0.4,
        ),
        SizedBox(
          height: 11,
        ),
        Text(
          'No story? Let’s write more',
          style: TextStyle(
            color: grayLightColor,
          ),
        ),
      ],
    );
  }
}

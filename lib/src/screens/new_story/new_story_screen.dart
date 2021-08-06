import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_story/src/components/appbar.dart';

class NewStoryScreen extends StatelessWidget {
  const NewStoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        hasBackAction: true,
        title: 'New Story',
        titleStyle: TextStyle(
          fontFamily: 'TheGirlNextDoor',
          fontSize: 24,
        ),
        actions: [
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
      ),
      body: Container(),
    );
  }
}

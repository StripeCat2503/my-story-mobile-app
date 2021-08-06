import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_story/src/components/appbar.dart';
import 'package:my_story/src/models/story.dart';
import 'package:my_story/src/screens/home/widgets/empty_story.dart';
import 'package:my_story/src/screens/home/widgets/story_list.dart';
import 'package:my_story/src/themes/color.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  var _list = [
    Story(
        id: 1,
        createdDate: DateTime.now(),
        title:
            'Today is the 18th date since Covid-19 disease, hope all will be alright!'),
    Story(
        id: 2,
        createdDate: DateTime.now(),
        title: 'Everything is boring, so I deciced to do something!'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: getAppBar(
          hasBackAction: false,
          title: 'MyStory',
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
          leading: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SvgPicture.asset(
              'lib/assets/images/app/app-logo.svg',
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Button to create new story
              Container(
                width: 124,
                margin: EdgeInsets.only(
                  top: 10,
                ),
                child: ElevatedButton(
                  onPressed: _newStory,
                  child: Row(
                    children: [
                      Text(
                        'New story',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      SvgPicture.asset('lib/assets/icons/quill.svg')
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: primaryLightColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 8,
                    shadowColor: Color(0xffFFA27D).withOpacity(0.5),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              _list.isEmpty
                  ? Container(
                      width: Get.width,
                      height: Get.height * 0.6,
                      child: EmptyStory(),
                    )
                  : StoryList(
                      stories: _list,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void _newStory() {}
}

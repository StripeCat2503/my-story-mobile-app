import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_story/src/config/route_config.dart';
import 'package:my_story/src/enums/story.dart';
import 'package:my_story/src/models/story.dart';
import 'package:my_story/src/themes/color.dart';
import 'package:my_story/src/utils/helpers.dart';
import 'package:my_story/src/utils/utils.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({
    Key? key,
    @required this.story,
  }) : super(key: key);

  final Story? story;

  Widget _buildPopupMenuButton() {
    return PopupMenuButton<StoryAction>(
      padding: EdgeInsets.zero,
      color: Color(0xffFFE7D9),
      itemBuilder: (context) {
        return _buildPopupMenuItems();
      },
      icon: SvgPicture.asset('lib/assets/icons/more.svg'),
    );
  }

  List<PopupMenuEntry<StoryAction>> _buildPopupMenuItems() {
    return [
      PopupMenuItem(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Edit',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SvgPicture.asset(
              'lib/assets/icons/quill.svg',
              color: Colors.black,
            ),
          ],
        ),
        value: StoryAction.edit,
      ),
      PopupMenuDivider(
        height: 0,
      ),
      PopupMenuItem(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Delete',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SvgPicture.asset(
              'lib/assets/icons/delete.svg',
              color: Colors.black,
            ),
          ],
        ),
        value: StoryAction.delete,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 10,
      ),
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 3,
        child: InkWell(
          splashColor: primaryLightColor,
          onTap: _onStoryItemTap,
          child: Ink(
            color: yellowPaperColor,
            child: Container(
              padding: EdgeInsets.only(
                left: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "At ${Helpers.getPostDate(DateTime.now())}",
                        style: TextStyle(
                          fontSize: 12,
                          color: blackDarkColor,
                        ),
                      ),
                      Spacer(),
                      _buildPopupMenuButton()
                    ],
                  ),
                  Container(
                    width: Get.width * 0.8,
                    child: Text(
                      'Today is the 18th date since Covid-19 disease, hope all will be alright!',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset('lib/assets/icons/story-banner.svg'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onStoryItemTap() {
    Get.toNamed(RouteConfig.STORY_READER);
  }
}

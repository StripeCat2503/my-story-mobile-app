import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_story/src/models/story.dart';
import 'package:my_story/src/themes/color.dart';
import 'package:my_story/src/utils/utils.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({
    Key? key,
    @required this.story,
  }) : super(key: key);

  final Story? story;

  Widget _buildPopupMenuButton() {
    return PopupMenuButton(
      padding: EdgeInsets.zero,
      color: Color(0xffFFE7D9),
      itemBuilder: (context) {
        return _buildPopupMenuItems();
      },
      icon: SvgPicture.asset('lib/assets/icons/more.svg'),
    );
  }

  List<PopupMenuEntry> _buildPopupMenuItems() {
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
      ),
    ];
  }

  String _getPostDate() {
    String time =
        Utils.convertDateToString(date: DateTime.now(), format: 'hh:mm a');

    String date =
        Utils.convertDateToString(date: DateTime.now(), format: 'MMM dd, yyyy');
    return '$time - $date';
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
          onTap: () {},
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
                        "At ${_getPostDate()}",
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
}

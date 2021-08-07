import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_story/src/components/appbar.dart';
import 'package:my_story/src/components/camera_screenshot.dart';
import 'package:my_story/src/components/icon_button.dart';
import 'package:my_story/src/constants/constants.dart';
import 'package:my_story/src/themes/color.dart';

class NewStoryScreen extends StatelessWidget {
  const NewStoryScreen({Key? key}) : super(key: key);

  Widget _buildPhotoButton() {
    return Container(
      child: MyIconButton(
        icon: SvgPicture.asset('lib/assets/icons/photo.svg'),
        onPressed: _openGalleryPhoto,
      ),
      margin: EdgeInsets.only(
        top: 4,
      ),
    );
  }

  Widget _buildCameraButton() {
    return MyIconButton(
      icon: SvgPicture.asset('lib/assets/icons/camera.svg'),
      onPressed: _openCamera,
    );
  }

  Widget _buildSaveButton() {
    return MyIconButton(
      onPressed: _saveStory,
      icon: SvgPicture.asset(
        'lib/assets/icons/check.svg',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellowPaperColor,
      appBar: getAppBar(
        bgColor: yellowPaperColor,
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
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildPhotoButton(),
                _buildCameraButton(),
                Spacer(),
                _buildSaveButton(),
              ],
            ),
            Form(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      autocorrect: false,
                      decoration: InputDecoration(
                        hintText: 'My title...',
                        isDense: true,
                        isCollapsed: true,
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          fontSize: 18,
                          color: Color(0xff8C8C8C),
                          fontWeight: FontWeight.w500,
                        ),
                        counterText: '',
                      ),
                      maxLines: null,
                      maxLength: AppConstants.MAX_STORY_TITLE_LENGTH,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.multiline,
                    ),
                    TextFormField(
                      autocorrect: false,
                      decoration: InputDecoration(
                        hintText: 'Write something...',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: Color(0xff8C8C8C),
                          fontWeight: FontWeight.w500,
                        ),
                        counterText: '',
                      ),
                      maxLines: null,
                      maxLength: AppConstants.MAX_STORY_TITLE_LENGTH,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveStory() {}

  void _openGalleryPhoto() {}

  void _openCamera() {
    Get.to(CameraScreenShot());
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_story/src/components/appbar.dart';
import 'package:my_story/src/components/camera_screenshot.dart';
import 'package:my_story/src/components/icon_button.dart';
import 'package:my_story/src/constants/constants.dart';
import 'package:my_story/src/controllers/new_story/new_story_controller.dart';
import 'package:my_story/src/themes/color.dart';

class NewStoryScreen extends StatelessWidget {
  NewStoryScreen({Key? key}) : super(key: key);

  final _newStoryController = Get.find<NewStoryController>();

  final _textController = TextEditingController();

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

  Widget _buildTypographyButton() {
    return Container(
      child: MyIconButton(
        icon: SvgPicture.asset(
          'lib/assets/icons/text.svg',
          width: 24,
        ),
        onPressed: _createTextBlock,
      ),
      margin: EdgeInsets.only(
        top: 6,
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
    print('123');
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
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildTypographyButton(),
                _buildPhotoButton(),
                _buildCameraButton(),
                Spacer(),
                _buildSaveButton(),
              ],
            ),
            Form(
              child: Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        onChanged: _newStoryController.updateTitle,
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
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.multiline,
                        autofocus: true,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      GetBuilder<NewStoryController>(
                        builder: (controller) {
                          return Column(
                            children: List.generate(controller.blocks.length,
                                (index) {
                              var block = controller.blocks[index];
                              if (block.blockType == BlockType.TEXT) {
                                int numOfTextBlocks = controller.blocks
                                    .where((block) =>
                                        block.blockType == BlockType.TEXT)
                                    .length;
                                return TextFormField(
                                  focusNode: controller.focusNodes[block.id],
                                  cursorColor: primaryColor,
                                  onChanged: (value) {
                                    if (value.isEmpty && numOfTextBlocks > 1) {
                                      controller.removeTextBlock(index);
                                      if (controller
                                          .focusNodes.entries.isNotEmpty) {
                                        controller.focusNodes.entries.last.value
                                            .requestFocus();
                                      }
                                    } else {
                                      controller.editTextBlock(index, value);
                                    }
                                  },
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                    // hintText: numOfTextBlocks == 1
                                    //     ? 'Write something...'
                                    //     : '',
                                    hintText: 'Write something...',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff8C8C8C),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    counterText: '',
                                    isDense: true,
                                    isCollapsed: true,
                                  ),
                                  maxLines: null,
                                  maxLength:
                                      AppConstants.MAX_STORY_TITLE_LENGTH,
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                  textInputAction: TextInputAction.newline,
                                  keyboardType: TextInputType.multiline,
                                  autofocus: true,
                                );
                              }

                              if (block.blockType == BlockType.IMAGE) {
                                var imageFile = File(block.image!);
                                return ConstrainedBox(
                                  constraints: BoxConstraints(),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                      vertical: 15,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(3),
                                      child: Image.file(
                                        imageFile,
                                        fit: BoxFit.cover,
                                        isAntiAlias: true,
                                      ),
                                    ),
                                  ),
                                );
                              }

                              return SizedBox.shrink();
                            }),
                          );
                        },
                      )
                    ],
                  ),
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

  void _createTextBlock() {
    _newStoryController.addTextBlock('');
  }
}

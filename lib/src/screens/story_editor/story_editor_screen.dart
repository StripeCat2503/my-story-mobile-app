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

class StoryEditorScreen extends StatelessWidget {
  StoryEditorScreen({
    Key? key,
    this.edit = false,
  }) : super(key: key);

  final bool edit;

  final _newStoryController = Get.find<NewStoryController>();

  Widget _buildPhotoButton() {
    return Container(
      child: MyIconButton(
        icon: SvgPicture.asset('lib/assets/icons/photo.svg'),
        onPressed: _newStoryController.pickPhotoFromGallery,
        tooltip: 'Add photo from gallery',
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
        tooltip: 'New text block',
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
      tooltip: 'Take photo',
    );
  }

  Widget _buildSaveButton() {
    return MyIconButton(
      onPressed: _newStoryController.saveStory,
      icon: SvgPicture.asset(
        'lib/assets/icons/check.svg',
      ),
      tooltip: 'Save',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellowPaperColor,
      appBar: getAppBar(
        bgColor: yellowPaperColor,
        hasBackAction: true,
        title: 'Story Editor',
        titleStyle: TextStyle(
          fontFamily: 'TheGirlNextDoor',
          fontSize: 24,
        ),
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
                                return Container(
                                  margin: EdgeInsets.only(bottom: 5),
                                  child: TextFormField(
                                    focusNode: controller.focusNodes[block.id],
                                    cursorColor: primaryColor,
                                    onChanged: (value) {
                                      controller.editTextBlock(index, value);
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
                                      suffix: index != 0
                                          ? InkWell(
                                              splashColor: primaryColor,
                                              radius: 30,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              onTap: () {
                                                controller
                                                    .removeTextBlock(index);
                                              },
                                              child: Icon(
                                                Icons.remove_circle,
                                                size: 16,
                                                color: violetColor,
                                              ),
                                            )
                                          : null,
                                    ),
                                    maxLines: null,
                                    maxLength:
                                        AppConstants.MAX_STORY_TITLE_LENGTH,
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    textInputAction: TextInputAction.newline,
                                    keyboardType: TextInputType.multiline,
                                  ),
                                );
                              }

                              if (block.blockType == BlockType.IMAGE) {
                                var imageFile = File(block.image!);
                                return Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                          blurRadius: 5,
                                          spreadRadius: 1,
                                          color: Colors.black.withOpacity(0.1),
                                        ),
                                      ]),
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
                                    Positioned(
                                      child: IconButton(
                                        onPressed: () {
                                          controller.removeImageBlock(index);
                                        },
                                        icon: Icon(
                                          Icons.cancel,
                                          color: violetColor,
                                        ),
                                      ),
                                      top: 15,
                                      right: 0,
                                    ),
                                  ],
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

  void _openCamera() {
    FocusManager.instance.primaryFocus?.unfocus();
    Get.to(CameraScreenShot());
  }

  void _createTextBlock() {
    _newStoryController.addTextBlock('');
  }
}

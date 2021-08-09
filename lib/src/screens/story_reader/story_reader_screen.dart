import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_story/src/components/appbar.dart';
import 'package:my_story/src/constants/constants.dart';
import 'package:my_story/src/controllers/story_reader/story_reader_controller.dart';
import 'package:my_story/src/models/block.dart';
import 'package:my_story/src/models/story.dart';
import 'package:my_story/src/themes/color.dart';
import 'package:my_story/src/utils/helpers.dart';

class StoryReaderScreen extends StatefulWidget {
  StoryReaderScreen({Key? key}) : super(key: key);

  @override
  _StoryReaderScreenState createState() => _StoryReaderScreenState();
}

class _StoryReaderScreenState extends State<StoryReaderScreen>
    with SingleTickerProviderStateMixin {
  final _controller = Get.find<StoryReaderController>();

  final _story = Story(
    id: 0,
    createdDate: DateTime.now(),
    title: 'Everything is boring, so I deciced to do something!',
    blocks: [
      Block(
        blockType: BlockType.TEXT,
        text: 'Clean my room',
      ),
      Block(
        blockType: BlockType.IMAGE,
        image:
            'https://www.humanesociety.org/sites/default/files/styles/1240x698/public/2020-07/kitten-510651.jpg?h=f54c7448&itok=ZhplzyJ9',
      ),
      Block(
        blockType: BlockType.TEXT,
        text: 'Clean my room',
      ),
      Block(
        blockType: BlockType.IMAGE,
        image:
            'https://www.humanesociety.org/sites/default/files/styles/1240x698/public/2020-07/kitten-510651.jpg?h=f54c7448&itok=ZhplzyJ9',
      ),
      Block(
        blockType: BlockType.TEXT,
        text: 'Clean my room',
      ),
      Block(
        blockType: BlockType.IMAGE,
        image:
            'https://www.humanesociety.org/sites/default/files/styles/1240x698/public/2020-07/kitten-510651.jpg?h=f54c7448&itok=ZhplzyJ9',
      ),
    ],
  );

  @override
  void initState() {
    super.initState();
    _controller.initAnimation(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellowPaperColor,
      appBar: getAppBar(
        bgColor: yellowPaperColor,
        hasBackAction: true,
        title: 'Just read',
        titleStyle: TextStyle(
          fontFamily: 'TheGirlNextDoor',
          fontSize: 24,
        ),
        actions: [
          IconButton(
            onPressed: _controller.navigateToEditScreen,
            icon: SvgPicture.asset('lib/assets/icons/edit.svg'),
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: NotificationListener<ScrollNotification>(
              onNotification: _controller.handleScrollNotification,
              child: SingleChildScrollView(
                controller: _controller.scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'At ${Helpers.getPostDate(_story.createdDate!)}',
                      style: TextStyle(
                        color: blackDarkColor,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      _story.title!,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(_story.blocks!.length, (index) {
                        var block = _story.blocks?[index];

                        if (block?.blockType == BlockType.TEXT) {
                          return _buildTextBlock(block!);
                        }

                        if (block?.blockType == BlockType.IMAGE) {
                          return _buildImageBlock(block!);
                        }

                        return SizedBox.shrink();
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 15,
            child: _buildBottomUpButton(),
          )
        ],
      ),
    );
  }

  ConstrainedBox _buildImageBlock(Block block) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: Get.width,
        minHeight: 200,
      ),
      child: Container(
        child: ClipRRect(
          child: CachedNetworkImage(
            imageUrl: block.image!,
            errorWidget: (context, _, error) {
              return Center(
                child: Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    'lib/assets/images/common/image-placeholder.png',
                    width: Get.width * 0.5,
                  ),
                ),
              );
            },
            placeholder: (context, url) {
              return Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            },
          ),
          borderRadius: BorderRadius.circular(
            3,
          ),
        ),
        margin: EdgeInsets.symmetric(
          vertical: 10,
        ),
      ),
    );
  }

  Text _buildTextBlock(Block block) => Text(block.text!);

  Widget _buildBottomUpButton() {
    return FadeTransition(
      opacity: _controller.fade!,
      child: RawMaterialButton(
        onPressed: _controller.moveToTop,
        elevation: 5,
        fillColor: yellowPaperColor,
        padding: EdgeInsets.all(
          15,
        ),
        splashColor: primaryLightColor,
        shape: CircleBorder(
          side: BorderSide(
            color: blackDarkColor.withOpacity(0.7),
          ),
        ),
        child: SvgPicture.asset('lib/assets/icons/bottom-to-top.svg'),
      ),
    );
  }
}

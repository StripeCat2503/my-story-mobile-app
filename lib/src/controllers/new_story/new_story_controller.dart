import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_story/src/constants/constants.dart';
import 'package:my_story/src/models/block.dart';

class NewStoryController extends GetxController {
  // State
  final blocks = <Block>[
    Block(blockType: BlockType.TEXT, text: '', order: 0, id: 0),
  ].obs;
  Rx<String> title = ''.obs;
  Map<int, FocusNode> focusNodes = {
    0: FocusNode(),
  };

  int id = 0;

  // Action
  void updateTitle(String newTitle) {
    title = newTitle.obs;
  }

  void addTextBlock(String text) {
    var textBlock = Block(
      id: ++id,
      blockType: BlockType.TEXT,
      text: text,
    );

    blocks.add(textBlock);
    focusNodes[textBlock.id] = FocusNode();
    focusNodes[textBlock.id]?.requestFocus();
    update();
  }

  void addImageBlock(String image) {
    var imageBlock = Block(
      id: ++id,
      blockType: BlockType.IMAGE,
      image: image,
    );

    blocks.add(imageBlock);
    update();
  }

  void removeTextBlock(int index) {
    int blockId = blocks[index].id;
    focusNodes.remove(blockId);
    blocks.removeAt(index);
    update();
  }

  void removeImageBlock(int index) {
    blocks.removeAt(index);
    update();
  }

  void editTextBlock(int index, String text) {
    blocks[index].text = text;

    update();
  }

  void editImageBlock(int index, String image) {
    blocks[index].image = image;
    update();
  }

  void pickPhotoFromGallery() async {
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      addImageBlock(image.path);
    }
  }

  void saveStory() {}
}

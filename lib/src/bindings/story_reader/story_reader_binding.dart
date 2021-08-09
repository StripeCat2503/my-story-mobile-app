import 'package:get/get.dart';
import 'package:my_story/src/controllers/story_reader/story_reader_controller.dart';

class StoryReaderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StoryReaderController());
  }
}

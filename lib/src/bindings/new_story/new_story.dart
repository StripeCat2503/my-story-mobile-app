import 'package:get/get.dart';
import 'package:my_story/src/controllers/components/camera_state_controller.dart';
import 'package:my_story/src/controllers/new_story/new_story_controller.dart';

class NewStoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewStoryController());
    Get.put(CameraStateController());
  }
}

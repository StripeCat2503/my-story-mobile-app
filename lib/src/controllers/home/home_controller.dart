import 'package:get/get.dart';
import 'package:my_story/src/config/route_config.dart';

class HomeController extends GetxController {
  void navigateToNewStoryScreen() {
    Get.toNamed(RouteConfig.STORY_EDITOR);
  }
}

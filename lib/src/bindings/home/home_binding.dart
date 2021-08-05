import 'package:get/get.dart';
import 'package:my_story/src/controllers/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}

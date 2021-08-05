import 'package:get/get.dart';
import 'package:my_story/src/controllers/sign_in/sign_in_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignInController());
  }
}

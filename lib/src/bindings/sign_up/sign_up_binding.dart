import 'package:get/get.dart';
import 'package:my_story/src/controllers/sign_up/sign_up_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController());
  }
}

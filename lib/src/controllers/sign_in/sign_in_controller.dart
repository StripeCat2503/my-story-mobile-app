import 'package:get/get.dart';
import 'package:my_story/src/config/route_config.dart';

class SignInController extends GetxController {
  // State

  // Action
  void signIn() {
    Get.toNamed(RouteConfig.HOME);
  }

  void navigateToSignUpScreen() {
    Get.toNamed(RouteConfig.SIGN_UP);
  }
}

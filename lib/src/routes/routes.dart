import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_story/src/bindings/home/home_binding.dart';
import 'package:my_story/src/bindings/new_story/new_story.dart';
import 'package:my_story/src/bindings/sign_in/sign_in_binding.dart';
import 'package:my_story/src/bindings/sign_up/sign_up_binding.dart';
import 'package:my_story/src/config/route_config.dart';
import 'package:my_story/src/screens/home/home_screen.dart';
import 'package:my_story/src/screens/new_story/new_story_screen.dart';
import 'package:my_story/src/screens/sign_in/sign_in.dart';
import 'package:my_story/src/screens/sign_up/sign_up.dart';

const initialRoute = RouteConfig.SIGN_IN;

List<GetPage> getAppRoutes() {
  return [
    GetPage(
      name: RouteConfig.SIGN_IN,
      page: () => SignInScreen(
        key: UniqueKey(),
      ),
      binding: SignInBinding(),
    ),
    GetPage(
      name: RouteConfig.SIGN_UP,
      page: () => SignUpScreen(
        key: UniqueKey(),
      ),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: RouteConfig.HOME,
      page: () => HomeScreen(
        key: UniqueKey(),
      ),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RouteConfig.NEW_STORY,
      page: () => NewStoryScreen(
        key: UniqueKey(),
      ),
      binding: NewStoryBinding(),
    ),
  ];
}

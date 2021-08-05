import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_story/src/bindings/sign_in/sign_in_binding.dart';
import 'package:my_story/src/bindings/sign_up/sign_up_binding.dart';
import 'package:my_story/src/config/app.dart';
import 'package:my_story/src/config/route_config.dart';
import 'package:my_story/src/screens/sign_in/sign_in.dart';
import 'package:my_story/src/screens/sign_up/sign_up.dart';
import 'package:my_story/src/themes/style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: showDebugBanner,
      theme: appThemeData(),
      home: SignInScreen(
        key: UniqueKey(),
      ),
      getPages: [
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
      ],
    );
  }
}

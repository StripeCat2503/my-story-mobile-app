import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_story/src/config/app.dart';
import 'package:my_story/src/routes/routes.dart';
import 'package:my_story/src/screens/sign_in/sign_in.dart';
import 'package:my_story/src/themes/style.dart';

List<CameraDescription>? cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

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
      getPages: getAppRoutes(),
      initialRoute: initialRoute,
    );
  }
}

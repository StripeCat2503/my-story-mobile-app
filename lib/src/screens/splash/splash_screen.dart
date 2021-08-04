import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_story/src/config/app.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.25,
                ),
                SvgPicture.asset('lib/assets/images/app/app-logo.svg'),
                Container(
                  margin: EdgeInsets.only(top: 19),
                  child: Text(
                    appName,
                    style: TextStyle(
                      fontFamily: 'TheGirlNextDoor',
                      fontSize: 30,
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: Get.height * 0.2,
            child: SvgPicture.asset(
              'lib/assets/images/splash_screen/circle-orange.svg',
            ),
          ),
          Positioned(
            top: Get.height * 0.1,
            right: 15,
            child: SvgPicture.asset(
              'lib/assets/images/splash_screen/circle-violet.svg',
            ),
          ),
          Positioned(
            top: Get.height * 0.55,
            left: 45,
            child: SvgPicture.asset(
              'lib/assets/images/splash_screen/circle-yellow-light.svg',
            ),
          ),
          Positioned(
            top: Get.height * 0.63,
            right: 82,
            child: SvgPicture.asset(
              'lib/assets/images/splash_screen/circle-blue.svg',
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Opacity(
              opacity: 0.7,
              child: SvgPicture.asset(
                'lib/assets/images/splash_screen/path.svg',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

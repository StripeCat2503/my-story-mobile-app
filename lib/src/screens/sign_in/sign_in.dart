import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_story/src/components/app_logo.dart';
import 'package:my_story/src/themes/color.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          width: Get.width,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: Get.height * 0.2),
                child: AppLogo(),
              ),
              SizedBox(
                height: 29,
              ),
              Text(
                'Tell your story, open the world',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 49,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 12),
                child: Align(
                  child: Text(
                    'sign in'.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: blackDarkColor,
                    ),
                  ),
                  alignment: Alignment.topLeft,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

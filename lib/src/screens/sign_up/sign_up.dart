import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_story/src/components/app_logo.dart';
import 'package:my_story/src/components/appbar.dart';
import 'package:my_story/src/components/button.dart';
import 'package:my_story/src/config/route_config.dart';
import 'package:my_story/src/themes/color.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _usernameController = TextEditingController();
  final _usernameFocusNode = FocusNode();

  final _passwordController = TextEditingController();
  final _passwordFocusNode = FocusNode();

  final _confirmPasswordController = TextEditingController();
  final _confirmPasswordFocusNode = FocusNode();

  Color _usernamePrefixIconColor = blackDarkColor;
  Color _passwordPrefixIconColor = blackDarkColor;
  Color _confirmPasswordPrefixIconColor = blackDarkColor;

  @override
  void initState() {
    super.initState();
    _usernameFocusNode.addListener(() {
      if (_usernameFocusNode.hasFocus) {
        _usernamePrefixIconColor = primaryLightColor;
      } else {
        _usernamePrefixIconColor = blackDarkColor;
      }
      setState(() {});
    });

    _passwordFocusNode.addListener(() {
      if (_passwordFocusNode.hasFocus) {
        _passwordPrefixIconColor = primaryLightColor;
      } else {
        _passwordPrefixIconColor = blackDarkColor;
      }
      setState(() {});
    });

    _confirmPasswordFocusNode.addListener(() {
      if (_confirmPasswordFocusNode.hasFocus) {
        _confirmPasswordPrefixIconColor = primaryLightColor;
      } else {
        _confirmPasswordPrefixIconColor = blackDarkColor;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: getPrimaryAppBar(
          title: 'Sign Up'.toUpperCase(),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
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
                  'Glad to be your friend!',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 49,
                ),
                Form(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 11),
                        child: TextFormField(
                          controller: _usernameController,
                          focusNode: _usernameFocusNode,
                          style: TextStyle(fontSize: 14),
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: 'Username',
                            hintStyle: TextStyle(
                              color: grayLightColor,
                              fontSize: 14,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: blackDarkColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(1),
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: SvgPicture.asset(
                                'lib/assets/icons/user.svg',
                                color: _usernamePrefixIconColor,
                              ),
                            ),
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 16,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: primaryLightColor,
                              ),
                            ),
                            focusColor: primaryLightColor,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 16),
                        child: TextFormField(
                          controller: _passwordController,
                          focusNode: _passwordFocusNode,
                          obscureText: true,
                          obscuringCharacter: '•',
                          style: TextStyle(fontSize: 14),
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              color: grayLightColor,
                              fontSize: 14,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: blackDarkColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(1),
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: SvgPicture.asset(
                                'lib/assets/icons/password.svg',
                                color: _passwordPrefixIconColor,
                              ),
                            ),
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 16,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: primaryLightColor,
                              ),
                            ),
                            focusColor: primaryLightColor,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 16),
                        child: TextFormField(
                          controller: _confirmPasswordController,
                          focusNode: _confirmPasswordFocusNode,
                          obscureText: true,
                          obscuringCharacter: '•',
                          style: TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                            hintText: 'Re-type password',
                            hintStyle: TextStyle(
                              color: grayLightColor,
                              fontSize: 14,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: blackDarkColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(1),
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: SvgPicture.asset(
                                'lib/assets/icons/password.svg',
                                color: _confirmPasswordPrefixIconColor,
                              ),
                            ),
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 16,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: primaryLightColor,
                              ),
                            ),
                            focusColor: primaryLightColor,
                          ),
                        ),
                      ),
                      BaseButton(
                        title: 'sign up'.toUpperCase(),
                        color: primaryLightColor,
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        borderRadius: 1,
                        onPressed: _onSignup,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSignIn() {
    Get.toNamed(RouteConfig.SIGN_IN);
  }

  void _onSignup() {}
}

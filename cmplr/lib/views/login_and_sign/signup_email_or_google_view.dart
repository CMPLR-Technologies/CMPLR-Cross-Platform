import 'dart:ui';

import '../../controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utilities/custom_widgets/custom_widgets.dart';

class SignupEmailOrGoogle extends StatelessWidget {
  const SignupEmailOrGoogle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
      init: SignupController(),
      builder: (controller) => Scaffold(
        body: Stack(
          children: [
            Center(
              child: TextWithImagesPageView(texts: [
                'Explore mind-blowing stuff.',
                'Follow Tumblrs that spark your interests.',
                'Customize how you look, be who you want.',
                'post anything: Text, GIFs, music, whatever.',
                'Welcome to Tumblr. Now push the button.',
              ], imagePathes: [
                'lib/utilities/assets/intro_screen/intro_1.gif',
                'lib/utilities/assets/intro_screen/intro_2.gif',
                'lib/utilities/assets/intro_screen/intro_3.jpg',
                'lib/utilities/assets/intro_screen/intro_4.jpg',
                'lib/utilities/assets/intro_screen/intro_5.gif',
              ]),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 120),
                  const Text(
                    'tumblr',
                    style: TextStyle(
                        fontSize: 56,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 320),
                  SignUpInButton(
                    text: 'Sign up with Email',
                    onTap: () {
                      controller.signUpEmail();
                    },
                  ),
                  const SizedBox(height: 15),
                  SignUpInButton(
                    text: 'Sign up with Google',
                    onTap: () {
                      controller.signUpGoogle();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

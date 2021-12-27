import '../../controllers/login_and_sign/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utilities/custom_widgets/custom_widgets.dart';
import '../../utilities/sizing/sizing.dart';

// ToDo: Need serious refactoring
class LoginEmailContinue extends StatelessWidget {
  const LoginEmailContinue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final visibleKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;

    return GetBuilder<LoginController>(
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
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
                  SizedBox(
                      height:
                          Sizing.blockSizeVertical * (visibleKeyboard ? 3 : 9)),
                  Text(
                    'c',
                    style: TextStyle(
                        fontSize:
                            Sizing.fontSize * (visibleKeyboard ? 17.5 : 35),
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                      height: Sizing.blockSizeVertical *
                          (visibleKeyboard ? 9 : 43.5)),
                  LoginTextField(
                    textFieldKey: const ValueKey('getEmail2_getEmail'),
                    controller: controller,
                    text: 'email',
                    focus: true,
                    enabled: true,
                    underlineColor: Colors.blueAccent,
                    isEmail: true,
                    iconColor: Colors.white,
                  ),
                  SizedBox(height: Sizing.blockSizeVertical * 1.5),
                  SizedBox(
                    child: Material(
                      child: InkWell(
                        child: Center(
                          child: Text(
                            'Enter Password',
                            key: const ValueKey('getEmail2_getPassword'),
                            style: TextStyle(
                                fontSize: Sizing.fontSize * 3.715,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        onTap: () {
                          controller.enterPasswordLoginEmail();
                        },
                        splashFactory: NoSplash.splashFactory,
                      ),
                      color: Colors.grey,
                    ),
                    width: Sizing.blockSize * 84,
                    height: Sizing.blockSizeVertical * 6,
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

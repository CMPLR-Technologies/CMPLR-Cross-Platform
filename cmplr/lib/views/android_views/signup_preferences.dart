import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';
import '../../controllers/controllers.dart';

class SignupPreferences extends StatelessWidget {
  const SignupPreferences({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupPreferencesController>(
      init: SignupPreferencesController(),
      builder: (controller) => Scaffold(
          appBar: AppBar(
            shadowColor: Colors.transparent,
            backgroundColor: const Color(0xFF001A35),
            actions: [
              (controller.isLoading)
                  ? CollectionScaleTransition(
                      children: [
                        Icon(Icons.crop_square_outlined),
                        Icon(Icons.crop_square_outlined),
                        Icon(Icons.crop_square_outlined),
                      ],
                    )
                  : Material(
                      color: Colors.transparent,
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Color(0x33f2f2f2),
                        onTap: () {
                          controller.nextButtonPressed();
                        },
                        child: Center(
                          child: Text(
                            '  ${controller.buttonText}  ',
                            style: TextStyle(
                                color: Color(controller.buttonTextColor),
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ))
            ],
          ),
          body: Column(children: [
            Container(
              width: double.infinity,
              height: 115,
              color: Color(0xFF001A35),
              padding: EdgeInsets.fromLTRB(15, 4, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What do you like?',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Whatever you\'re into, you\'ll find it here. '
                    'Follow some of the tags below to start filling '
                    'your dashboard with the things you love.',
                    style: TextStyle(color: Color(0xFF7F8D9C), fontSize: 19),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 6, 10, 0),
                    color: const Color(0xFF001A35),
                    child: GridView.builder(
                        primary: false,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12),
                        itemCount:
                            controller.availablePreferenceCards.length + 1,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return buildCustomCard(controller);
                          }
                          return buildPreferencesCard(controller, index - 1);
                        }))),
          ])),
    );
  }

  Widget buildCustomCard(SignupPreferencesController controller) {
    return Material(
      color: Color(0xFF001A35),
      child: InkWell(
        splashColor: Color(0xaa00689b),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        onTap: () {
          controller.chooseNewPreference();
        },
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              border: Border.all(color: Colors.white, width: 1.5)),
          child: Stack(
            children: [
              Positioned(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                bottom: 60,
                left: 10,
              ),
              Positioned(
                child: Container(
                  width: 125,
                  padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
                  child: Text(
                    'Choose your own',
                    maxLines: 2,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                bottom: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPreferencesCard(
      SignupPreferencesController controller, int index) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        controller.tapPreferenceCard(index);
      },
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Color(controller.availablePreferenceCards[index].color)),
        child: Stack(
          children: [
            Positioned(
              child: Visibility(
                visible: controller.availablePreferenceCards[index].isChosen,
                child: IconButton(
                  icon: Icon(Icons.verified),
                  onPressed: () {},
                ),
              ),
              top: 0,
              right: 0,
            ),
            Positioned(
              child: Container(
                width: 125,
                padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
                child: Text(
                  controller.availablePreferenceCards[index].preferenceName,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  maxLines: 3,
                  overflow: TextOverflow.visible,
                ),
              ),
              bottom: 10,
            )
          ],
        ),
      ),
    );
  }
}

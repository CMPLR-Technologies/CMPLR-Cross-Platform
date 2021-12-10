import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';
import '../../controllers/controllers.dart';
import '../../routes.dart';
import '../../utilities/custom_icons/custom_icons.dart';
import '../../utilities/sizing/sizing.dart';

class SignupPreferences extends StatelessWidget {
  const SignupPreferences({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /// This method handles the user click of the system back button
    Future<bool> _onBackPressed() async {
      return await showDialog(
              context: context,
              builder: (context) => Dialog(
                  insetPadding: EdgeInsets.zero,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: Sizing.blockSizeVertical * 21.75,
                    padding: EdgeInsets.fromLTRB(
                      Sizing.blockSizeVertical * 3,
                      Sizing.blockSizeVertical * 3,
                      Sizing.blockSizeVertical * 3,
                      0,
                    ),
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(Sizing.blockSize * 2.5,
                                0, Sizing.blockSize * 2.5, 0),
                            child: Text(
                              'Aw. If you leave now,'
                              ' you\'ll lose all your progress.',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: Sizing.fontSize * 4.9),
                            )),
                        SizedBox(
                          height: Sizing.blockSizeVertical * 3,
                        ),
                        Row(
                          children: [
                            SizedBox(width: Sizing.blockSize * 48),
                            TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text(
                                  'CONTINUE',
                                  style: TextStyle(
                                      fontSize: Sizing.fontSize * 3.715),
                                )),
                            SizedBox(
                              width: Sizing.blockSize * 2.5,
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.offAllNamed(Routes.signupOrLoginScreen);
                                },
                                child: Text('LEAVE',
                                    style: TextStyle(
                                        fontSize: Sizing.fontSize * 3.715)))
                          ],
                        )
                      ],
                    ),
                  ))) ??
          false;
    }

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: GetBuilder<SignupPreferencesController>(
        init: SignupPreferencesController(),
        builder: (controller) => Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              shadowColor: Colors.transparent,
              backgroundColor: const Color(0xFF001A35),
              actions: [
                (controller.isLoading)
                    ? CollectionScaleTransition(
                        children: [
                          const Icon(Icons.crop_square_outlined),
                          const Icon(Icons.crop_square_outlined),
                          const Icon(Icons.crop_square_outlined),
                        ],
                      )
                    : Material(
                        color: const Color(0xFF001A35),
                        child: InkWell(
                          key: const ValueKey('signUpPreferences_next'),
                          highlightColor: Colors.transparent,
                          // TODO: HARDCODED
                          splashColor: const Color(0x33f2f2f2),
                          onTap: () {
                            controller.nextButtonPressed();
                          },
                          child: Center(
                            child: Text(
                              '  ${controller.buttonText}  ',
                              style: TextStyle(
                                  color: Color(controller.buttonTextColor),
                                  fontSize: Sizing.fontSize * 4.65,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ))
              ],
            ),
            body: Column(children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                // TODO: HARDCODED
                color: const Color(0xFF001A35),
                padding: EdgeInsets.fromLTRB(Sizing.blockSize * 3.5,
                    Sizing.blockSizeVertical * 0.6, Sizing.blockSize * 3.5, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'What do you like?',
                      style: TextStyle(
                          color: Colors.white, fontSize: Sizing.fontSize * 7),
                    ),
                    SizedBox(
                      height: Sizing.blockSizeVertical * 1.5,
                    ),
                    Text(
                      'Whatever you\'re into, you\'ll find it here. '
                      'Follow some of the tags below to start filling '
                      'your dashboard with the things you love.',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: Sizing.blockSize * 4.55),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.fromLTRB(
                        Sizing.blockSize * 2.5,
                        Sizing.blockSizeVertical * 0.9,
                        Sizing.blockSize * 2.5,
                        0,
                      ),
                      // TODO: HARDCODED
                      color: const Color(0xFF001A35),
                      child: GridView.builder(
                          primary: false,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio:
                                      (MediaQuery.of(context).size.width / 3) /
                                          (MediaQuery.of(context).size.height /
                                              4.65),
                                  crossAxisCount: 3,
                                  crossAxisSpacing: Sizing.blockSize * 3,
                                  mainAxisSpacing:
                                      Sizing.blockSizeVertical * 0.3),
                          itemCount:
                              controller.availablePreferenceCards.length + 1,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return buildCustomCard(
                                controller,
                                key: const ValueKey('signUpPreferences_yours'),
                              );
                            }
                            return buildPreferencesCard(controller, index - 1,
                                'signUpPreferences_index');
                          }))),
            ])),
      ),
    );
  }

  /// This method builds the 'Choose your own' widget,
  /// (it navigates to the preferences search page)
  Widget buildCustomCard(SignupPreferencesController controller,
      {ValueKey<String>? key}) {
    return Padding(
        key: key,
        padding: EdgeInsets.fromLTRB(0, 0, 0, Sizing.blockSizeVertical * 1.5),
        child: Material(
          // TODO: HARDCODED

          color: const Color(0xFF001A35),
          child: InkWell(
            // TODO: HARDCODED

            splashColor: const Color(0xaa00689b),
            borderRadius:
                BorderRadius.all(Radius.circular(Sizing.blockSize * 4.95)),
            onTap: () {
              controller.chooseNewPreference();
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(Sizing.blockSize * 4.95)),
                  border: Border.all(
                      color: Colors.white, width: Sizing.blockSize * 0.4)),
              child: Stack(
                children: [
                  Positioned(
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    bottom: Sizing.blockSizeVertical * 9,
                    left: Sizing.blockSize * 2.5,
                  ),
                  Positioned(
                    child: Container(
                      width: Sizing.blockSize * 31,
                      padding: EdgeInsets.fromLTRB(
                          Sizing.blockSize * 3.5, 0, Sizing.blockSize * 3.5, 0),
                      child: Text(
                        'Choose your own',
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Sizing.fontSize * 4.65,
                        ),
                      ),
                    ),
                    bottom: Sizing.blockSizeVertical * 1.5,
                  )
                ],
              ),
            ),
          ),
        ));
  }

  /// This method build all the preference card in the grid view
  Widget buildPreferencesCard(
      SignupPreferencesController controller, int index, String key) {
    return InkWell(
      key: ValueKey(key + index.toString()),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        controller.tapPreferenceCard(index);
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          0,
          0,
          0,
          Sizing.blockSize * 4.65,
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(Sizing.blockSize * 4.95)),
              color: Color(controller.availablePreferenceCards[index].color)),
          child: Stack(
            children: [
              Positioned(
                child: Visibility(
                  visible: controller.availablePreferenceCards[index].isChosen,
                  child: IconButton(
                    icon: Icon(
                      CustomIcons.check,
                      size: Sizing.blockSize * 5,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                ),
                top: 0,
                right: 0,
              ),
              Positioned(
                child: Container(
                  width: Sizing.blockSize * 31,
                  padding: EdgeInsets.fromLTRB(
                      Sizing.blockSize * 3.45, 0, Sizing.blockSize * 3.45, 0),
                  child: Text(
                    controller.availablePreferenceCards[index].preferenceName,
                    style: TextStyle(
                        fontSize: Sizing.fontSize * 4.65, color: Colors.black),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                bottom: Sizing.blockSizeVertical * 1.5,
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/android_views/android_views.dart';

void main() {
  runApp(const CMPLR());
}

class CMPLR extends StatelessWidget {
  const CMPLR({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupAge(),
      getPages: [
        GetPage(name: '/signup_preferences', page: () => SignupPreferences()),
        GetPage(
            name: '/signup_preferences_search',
            page: () => SignupPreferencesSearch()),
      ],
    );
  }
}

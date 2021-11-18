import 'flags.dart';
import 'views/master_page.dart';
import 'package:get_storage/get_storage.dart';

import 'cmplr_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/login_and_sign/android_views.dart';

Future<void> main() async {
  await GetStorage.init();

  // Clears all persistent data based on a flag
  // USE CAREFULLY
  if (Flags.cleanSlate) {
    GetStorage().erase();
  }
  runApp(const CMPLR());
}

class CMPLR extends StatelessWidget {
  const CMPLR({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // (Tarek) TODO: Does this count as 'logic'?
      home: GetStorage().read('logged_in') ?? false
          ? const MasterPage()
          : const IntroScreen(),
      theme: CMPLRTheme.dark(),
      getPages: [
        GetPage(
            name: '/signup_preferences_search',
            page: () => const SignupPreferencesSearch()),
        GetPage(name: '/login', page: () => const Login()),
        GetPage(name: '/intro_screen', page: () => const IntroScreen()),
        GetPage(
            name: '/EmailPasswordNameAfterSignup',
            page: () => const EmailPasswordNameAfterSignup()),
        GetPage(
            name: '/signup_preferences', page: () => const SignupPreferences()),
        GetPage(name: '/signup_age', page: () => const SignupAge()),
        GetPage(
            name: '/signup_preferences_search',
            page: () => const SignupPreferencesSearch()),
        GetPage(name: '/login', page: () => const Login()),
        // GetPage(name: '/forgot_password', page: () => const ForgotPassword()),
        GetPage(
            name: '/profile', page: () => const Center(child: Text('Profile'))),
      ],
    );
  }
}

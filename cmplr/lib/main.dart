import 'flags.dart';
import 'cmplr_theme.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'views/views.dart';

// void main() => runApp(const FilePickerDemo());

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
      home: GetStorage().read('logged_in') ?? false
          ? const ReblogView() /*const MasterPage()*/
          : const ReblogView() /*SignupOrLoginScreen()*/,
      theme: CMPLRTheme.dark(),
      getPages: getLoginAndSignPages + getHomeScreenPages,
    );
  }

  List<GetPage<dynamic>> get getHomeScreenPages {
    return [
      GetPage(
          name: '/profile', page: () => const Center(child: Text('Profile'))),
    ];
  }
}

List<GetPage<dynamic>> get getLoginAndSignPages {
  return [
    GetPage(name: '/reblog', page: () => const ReblogView()),
    GetPage(
        name: '/signup_or_login_screen',
        page: () => const SignupOrLoginScreen()),
    GetPage(name: '/signup_age_screen', page: () => const SignupAge()),
    GetPage(
        name: '/signup_preferences_search_screen',
        page: () => const SignupPreferencesSearch()),
    GetPage(
        name: '/signup_preferences_screen',
        page: () => const SignupPreferences()),
    GetPage(
        name: '/signup_preferences_search_screen',
        page: () => const SignupPreferencesSearch()),
    GetPage(
        name: '/signup_mail_name_screen', page: () => const SignupMailName()),
    GetPage(name: '/login', page: () => const Login()),
    // GetPage(name: '/forgot_password', page: () => const ForgotPassword()),
  ];
}

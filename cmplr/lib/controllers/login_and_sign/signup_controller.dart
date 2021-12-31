import '../../models/persistent_storage_api.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../routes.dart';
import '../../views/views.dart';
import '../../utilities/authentication/authentication.dart';

class SignupController extends GetxController {
  /// Navigates to the page where the user can enter their age
  /// and continue the signup process

  /// handles signing up using google
  /// this function uses firebase for
  /// authentication and communication with google
  Future<void> signUpGoogle(BuildContext context) async {
    await Authentication.initializeFirebase();
    User? user;
    user = await Authentication.signInWithGoogle(context: context);
    if (user != null) {
      Get.offAll(
        const MasterPage(),
        transition: Transition.rightToLeft,
        routeName: Routes.masterPage,
        arguments: user,
      );
      PersistentStorage.changeLoggedIn(true);
    } else {
      _showToast('Failed to Sign up, please try again');
    }
    update();
  }
}

void _showToast(String message) => Fluttertoast.showToast(
      msg: message,
      fontSize: 16,
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.white,
      backgroundColor: const Color(0xFF4E4F53),
      timeInSecForIosWeb: 1,
    );

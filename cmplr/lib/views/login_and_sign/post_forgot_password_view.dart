import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/controllers.dart';
import '../../utilities/sizing/sizing.dart';

class PostForgotPassword extends StatelessWidget {
  const PostForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: Sizing.blockSizeVertical * 10.5,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: Sizing.blockSize * 28.5),
              Text(
                't',
                style: TextStyle(
                    fontSize: Sizing.blockSize * 16.25,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(width: Sizing.blockSize * 28.5),
              InkWell(
                child: const Text(
                  'Log in',
                  style: TextStyle(color: Colors.blueAccent),
                ),
                onTap: () {
                  controller.returnFromSendResetEmail();
                },
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Okay, we just send you a password reset',
                style: TextStyle(
                    fontSize: Sizing.blockSize * 5,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: Sizing.blockSizeVertical * 0.5),
            Center(
              child: Text(
                'email',
                style: TextStyle(
                    fontSize: Sizing.blockSize * 5,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: Sizing.blockSizeVertical * 1.5),
            Center(
              child: Text(
                'Didn\'t get it? Check your spam folder if it\'s not',
                style: TextStyle(
                    fontSize: Sizing.blockSize * 4.25,
                    color: Colors.grey,
                    fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(height: Sizing.blockSizeVertical * 0.5),
            Center(
              child: Text(
                // TODO: Change "our help docs" to hyper link & bold
                // & white text
                'there, follow the tips in our help docs.',
                style: TextStyle(
                    fontSize: Sizing.blockSize * 4.25,
                    color: Colors.grey,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

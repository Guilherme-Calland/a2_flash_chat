import 'package:a2_flash_chat/components/flash_chat_button.dart';
import 'package:a2_flash_chat/components/flash_chat_keys.dart';
import 'package:a2_flash_chat/components/flash_chat_methods.dart';
import 'package:a2_flash_chat/constants.dart';
import 'package:a2_flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: flashChatBackGroundColor,
      body: Padding(
        padding: const EdgeInsets.all(45.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SlideInDown(
              key: loginSlideInDownKey,
              child: Text(
                'Login',
                style: flashChatTitleTextStyle.copyWith(
                  color: Colors.green
                ),
              ),
            ),
            SizedBox(height: 48),
            SlideInRight(
              key: loginSlideInRightKey,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                keyboardAppearance: Brightness.dark,
                onChanged:(value){},
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: flashChatTextFieldDecoration(
                  hintText: 'Enter your email',
                  borderColor: Colors.green
                )
              ),
            ),
            SizedBox(height: 20),
            SlideInLeft(
              key: loginSlideInLeftKey,
              child: TextField(
                obscureText: true,
                keyboardAppearance: Brightness.dark,
                onChanged:(value){},
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: flashChatTextFieldDecoration(
                  hintText: 'Enter your password',
                  borderColor: Colors.green
                )
              ),
            ),
            SizedBox(height: 56),
            SlideInRight(
              key: loginSlideInRightButtonKey,
              child: FlashChatButton(
                color: Colors.green,
                text: 'Log in',
                onPressed: (){
                  //register
                }
              ),
            ),
            SizedBox(height: 30),
            SlideInLeft(
              key: loginSlideInLeftButtonKey,
              child: FlashChatButton(
                color: Color(0xff043500),
                text: 'Back',
                onPressed: (){
                  Navigator.popAndPushNamed(
                    context,
                    'welcome_screen');
                }
              ),
            )
          ],
        ),
      )
    );
  }
}
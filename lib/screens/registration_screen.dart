import 'package:a2_flash_chat/components/flash_chat_button.dart';
import 'package:a2_flash_chat/components/flash_chat_keys.dart';
import 'package:a2_flash_chat/components/flash_chat_methods.dart';
import 'package:a2_flash_chat/constants.dart';
import 'package:a2_flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

class RegistrationScreen extends StatefulWidget {

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
              key: registrationSlideInDownKey,
              child: Text(
                'Registration',
                style: flashChatTitleTextStyle.copyWith(
                  color: Colors.blue
                ),
              ),
            ),
            SizedBox(height: 48),
            SlideInRight(
              key: registrationSlideInRightKey,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                keyboardAppearance: Brightness.dark,
                onChanged:(value){},
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: flashChatTextFieldDecoration(
                  hintText: 'Enter your email',
                  borderColor: Colors.blue
                )
              ),
            ),
            SizedBox(height: 20),
            SlideInLeft(
              key: registrationSlideInLeftKey,
              child: TextField(
                obscureText: true,
                keyboardAppearance: Brightness.dark,
                onChanged:(value){},
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: flashChatTextFieldDecoration(
                  hintText : 'Enter your password', 
                  borderColor: Colors.blue
                )
              )
            ),
            SizedBox(height: 56),
            SlideInRight(
              key: registrationSlideInRightButtonKey,
              child: FlashChatButton(
                color: Colors.blue,
                text: 'Register',
                onPressed: (){
                  //register
                }
              ),
            ),
            SizedBox(height: 30),
            SlideInLeft(
              key: registrationSlideInLeftButtonKey,
              child: FlashChatButton(
                color: Color(0xff003758),
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
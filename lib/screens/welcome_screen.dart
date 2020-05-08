import 'package:a2_flash_chat/components/flash_chat_button.dart';
import 'package:a2_flash_chat/components/flash_chat_keys.dart';
import 'package:a2_flash_chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

class WelcomeScreen extends StatefulWidget {

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: flashChatBackGroundColor,
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SlideInDown(
              key: welcomeSlideInDownKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'images/logo.png',
                    height: 60,),
                  Text(
                    'Gui\'s app',
                    style: flashChatTitleTextStyle
                  )
                ],
              ),
            ),
            SizedBox(
              height: 48,
            ),
            SlideInRight(
              key: welcomeSlideInRightKey,
              child: FlashChatButton(
                text: 'Log in',
                color: Colors.green,
                onPressed: (){
                  Navigator.popAndPushNamed(
                    context, 
                    'login_screen'
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SlideInLeft(
              key: welcomeSlideInLeftKey,
              child: FlashChatButton(
                text: 'Register',
                color: Colors.blue,
                onPressed: (){
                  Navigator.popAndPushNamed(
                    context,
                    'registration_screen'
                  );
                },
              ),
            ),
          ],
        )
      )
    );
  }
}


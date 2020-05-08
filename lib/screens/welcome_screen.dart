import 'package:a2_flash_chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

class WelcomeScreen extends StatefulWidget {

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override

  final GlobalKey<AnimatorWidgetState> slideInDownKey =
  GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> slideInRightKey =
  GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> slideInLeftKey =
  GlobalKey<AnimatorWidgetState>();
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: flashChatBackGroundColor,
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SlideInDown(
              key: slideInDownKey,
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
              key: slideInRightKey,
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
              key: slideInLeftKey,
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

class FlashChatButton extends StatelessWidget {
  String text;
  Color color;
  Function onPressed;
  FlashChatButton({this.text, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: 300,
        padding: EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 20
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
      )
    );
  }
}
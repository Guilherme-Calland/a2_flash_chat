import 'package:a2_flash_chat/screens/chat_screen.dart';
import 'package:a2_flash_chat/screens/login_screen.dart';
import 'package:a2_flash_chat/screens/registration_screen.dart';
import 'package:a2_flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: FlashChat(),
    debugShowCheckedModeBanner: false,
  ));
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'chat_screen',
      routes: {
        'welcome_screen' : (context) => WelcomeScreen(),
        'registration_screen' : (context) => RegistrationScreen(),
        'login_screen' : (context) => LoginScreen(),
        'chat_screen' : (context) => ChatScreen(),
      },
    );
  }
}
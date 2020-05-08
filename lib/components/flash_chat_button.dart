import 'package:flutter/material.dart';

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
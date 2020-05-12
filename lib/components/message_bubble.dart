import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String sender;
  final String text;
  final bool isMe;

  MessageBubble({this.sender, this.text, this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start, 
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white
            ),
          ),
          Material(
            borderRadius: isMe 
            ? BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30) ,
              )
            : BorderRadius.only(
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)
            ),
            elevation: 5,
            color: isMe ? Color(0xff00253b) : Color(0xff043500),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 30
              ),
              child: Text(
                text,
                style: TextStyle(
                fontSize: 20,
                color: isMe ? Colors.white : Colors.white
                )
              ) 
            )
          )
        ],
      )
    );
  }
}
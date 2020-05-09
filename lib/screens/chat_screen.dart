import 'package:a2_flash_chat/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

Firestore _firestore = Firestore.instance;

class _ChatScreenState extends State<ChatScreen> {
  FirebaseUser currentUser;
  FirebaseAuth _auth;
  var controller = TextEditingController();
  String currentMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: flashChatBackGroundColor,
      appBar: AppBar(
        title: Text('Chat'),
        backgroundColor: Color(0xff003758),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            color: Colors.white,
            onPressed: (){
              _auth.signOut();
              Navigator.popAndPushNamed(
              context,
              'welcome_screen'
              );
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          MessagesStream(),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Color(0xff003758),
                    child: TextField(
                      controller: controller,
                      style: TextStyle(
                        color: Colors.black
                      ),
                      onChanged: (value) {
                        currentMessage = value;
                      },
                    ),
                  ),
                ),
                FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  disabledColor: Color(0xff00253b),
                  child: Text(
                    'Send',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  // onPressed: () {
                  //   _firestore.collection('messages').add(
                  //     {
                  //       'text' : messageText,
                  //       'sender' : loggedInUser.email
                  //     }
                  //   );
                  //   messageTextController.clear();
                  // },
                  // child: Text(
                  //   'Send',
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}


class MessagesStream extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder <QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            )
          );
        }
        final messages = snapshot.data.documents.reversed;
        List< Text > messageBubbles = [];
        for(var message in messages){
          final text = message.data['text'];
          final sender = message.data['sender'];
          final messageBubble = 
          Text(
            '$text from $sender',
            style: TextStyle(
              color: Colors.white
            ),
          );
          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            children: messageBubbles,
          )
        );
      }
    );
  }
}
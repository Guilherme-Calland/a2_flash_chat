import 'package:a2_flash_chat/components/message_bubble.dart';
import 'package:a2_flash_chat/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

final _firestore = Firestore.instance;
FirebaseUser currentUser;
bool isMe = false;

class _ChatScreenState extends State<ChatScreen> {

  var _auth = FirebaseAuth.instance;
  var controller = TextEditingController();
  String currentMessage;
  
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  void dispose(){
    super.dispose();
    _auth.signOut();
  }

  void getCurrentUser() async{
    try{
      final user = await _auth.currentUser();
      if(user != null){
        currentUser = user;
        print('Currrent User: ' + currentUser.email);
      }
    }catch(e){
      print('didnt manage to get user wawa: $e');
    }
  }


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
                        color: Colors.white
                      ),
                      onChanged: (value) {
                        currentMessage = value;
                      },
                    ),
                  ),
                ),
                FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  color: Color(0xff00253b),
                  disabledColor: Color(0xff00253b),
                  child: Text(
                    'Send',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  onPressed: () {
                    controller.clear();
                    _firestore.collection('messages')
                    .add(
                      {
                        'text' : currentMessage,
                        'sender' : currentUser.email,
                        'date' : DateTime.now()
                      }
                    );
                  },
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
      stream: _firestore.collection('messages')
      .orderBy('date', descending: true).snapshots(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            )
          );
        }
        final messages = snapshot.data.documents;
        List< MessageBubble > messageBubbles = [];
        for(var message in messages){
          final text = message.data['text'];
          final sender = message.data['sender'];
          final messageBubble = 
          MessageBubble(
            text: text,
            sender: sender,
            isMe: sender == currentUser.email 
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
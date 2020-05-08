import 'package:flutter/material.dart';

flashChatTextFieldDecoration({
  String hintText,
  Color borderColor
}){
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(
      color:Colors.grey,
    ),
    contentPadding: 
    EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 20
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30))
    ),
    enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: borderColor, width: 1),
    borderRadius: BorderRadius.all(Radius.circular(32))
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(32))
    )
  );
} 
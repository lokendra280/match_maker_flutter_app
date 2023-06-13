import 'package:flutter/material.dart';
import 'package:match_maker/module/auth/data/model/user_model.dart';
import 'package:match_maker/module/chat_screen.dart/data/message.dart';

class Chat extends StatefulWidget {
  // final ChatUser user;
  final UserModel user;
  const Chat({super.key, required this.user});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List <Messages> _list = [];
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
    child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // flexibleSpace: ,
      ),
    ),
    );
  }
}
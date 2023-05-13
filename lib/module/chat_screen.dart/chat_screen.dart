import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          
        },
        child: const ListTile(
          leading: CircleAvatar(child: Icon(CupertinoIcons.person),),
          title: Text("Demo User"),
          subtitle: Text("Last User message", maxLines: 1,),
          trailing: Text("12:00 PM",style: TextStyle(color: Colors.black54),),
        ),
      ),
    );
  }
}
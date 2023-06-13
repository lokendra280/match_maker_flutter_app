import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:match_maker/module/auth/data/model/user_model.dart';
import 'package:match_maker/module/chat_screen.dart/chat.dart';
import 'package:match_maker/module/chat_screen.dart/search_chat.dart';

import 'chat_room.dart';
import 'domain/api.dart';

class ChatScreen extends StatefulWidget {
//final UserModel user;
  const ChatScreen({super.key,});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}
  bool isLoading = false;

class _ChatScreenState extends State<ChatScreen> {

  List<UserModel> _list = [] ;
     Map<String, dynamic>? userMap;

 void _onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    setState(() {
      isLoading = true;
    });
    await _firestore
        .collection('users')
        
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();
        isLoading = false;
      });
      print(userMap);
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
      actions: [
        IconButton(onPressed: (){
              // Navigator.push(  
              //     context,  
              //     MaterialPageRoute(builder: (context) =>  SearchScreen()),  
              //     );  
        }, icon: const Icon(Icons.search_off_outlined))
      ],
      title: const Text("Chat Screen"),
      centerTitle: true,
      
      ),
    
      body: StreamBuilder(
      stream: APIs.getAllUser(),
      builder: (context, snapshot){
      switch (snapshot.connectionState){
        case ConnectionState.waiting:
        case ConnectionState.none:
        return const Center(child: CircularProgressIndicator());
        case ConnectionState.active:
        case ConnectionState.done:
            final list = [];
      
        final data = snapshot.data?.docs;
      for (var i in data!){
        print('Data: ${i.data()}');
        list.add(i.data()['name']);
        // list.add(i.data()['profilePic']);
      }
      // log('Data: $ ');
      
      return ListView.builder(
      
      itemCount: list.length,
      padding: EdgeInsets.only(top: .01 * MediaQuery.of(context).size.height ),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index){
      return Card(
      margin: EdgeInsets.symmetric(horizontal: .04 * MediaQuery.of(context).size.width , vertical: 4),
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
      onTap: () {
      
         //Navigator.push(context, MaterialPageRoute(builder: (_) => Chat(user: widget.user) ));
      },
      child:  ListTile(
        leading: CachedNetworkImage(
        width: .055 * MediaQuery.of(context).size.width,
        height: .055 * MediaQuery.of(context).size.height,
        imageUrl: '',
         errorWidget: (context, url, error) => const Icon(CupertinoIcons.person),
     ),
        title: Text('${list[index]}'),
        subtitle: const Text("Last User message", maxLines: 1,),
        trailing: const Text("12:00 PM",style: TextStyle(color: Colors.black54),),
      ),
      ),
    );
      }
      );
      }
    
      }
      )
    );
  }
}

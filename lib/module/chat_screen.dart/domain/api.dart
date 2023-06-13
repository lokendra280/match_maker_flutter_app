import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:match_maker/module/auth/data/model/user_model.dart';
import 'package:match_maker/module/chat_screen.dart/chat_screen.dart';

import '../data/message.dart';

class APIs {
  // static User get user => auth.currentUser!;

  static FirebaseAuth auth = FirebaseAuth.instance;
  static late UserModel me;

  // to return current user
  static User get user => auth.currentUser!;
    // for authentication
//  static FirebaseAuth auth = FirebaseAuth.instance;

  // for accessing cloud firestore database
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  // for accessing firebase storage
  static FirebaseStorage storage = FirebaseStorage.instance;

  //static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllUser (){
    return firestore.collection('users').where('phoneNumber',isNotEqualTo: user.phoneNumber).snapshots();
  
}
// static FirebaseFirestore firestore = Firebase
  static Stream<QuerySnapshot<Map<String, dynamic>>> getspecuser (){
    return firestore.collection('users').where('phoneNumber',isNotEqualTo: user.phoneNumber).snapshots();
  
}

//useful for getting conversion id 
static String getConversionID(String id) => user.uid.hashCode <= id.hashCode ? '${user.uid}_$id': '${id}_${user.uid}';

// for getting all messages of a specific conversion from firestore database
  static Stream<QuerySnapshot<Map<String, dynamic>>> getMyUsersId() {
    return firestore
        .collection('users')
        .doc(user.uid)
        .collection('my_users')
        .snapshots();
  }
//for sending message 

static Future<void> sendMessage(UserModel chatuser , String msg, Type type) async{
final time = DateTime.now().microsecondsSinceEpoch.toString();

// message to send 
final Messages message = Messages(   
    toId: user.uid,
        msg: msg,
        read: '',
        type: type,
        fromId: user.uid,
        sent: time);
          final ref = firestore
        .collection('chats/${getConversionID(user.uid)}/messages/');
        await ref.doc(time).set(message.toJson());
}

}



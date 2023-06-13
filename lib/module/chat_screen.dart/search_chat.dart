// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:match_maker/core/presentation/resources/size_constants.dart';
// import 'package:match_maker/core/presentation/widget/forms/buttons.dart';

// import 'chat_room.dart';

// class SearchScreen extends StatefulWidget {
//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//    Map<String, dynamic>? userMap;
//   bool isLoading = false;
//     final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


//   final TextEditingController _search = TextEditingController();
//     final FirebaseAuth _auth = FirebaseAuth.instance;
//   String? _id;

//   String chatRoomId(String user1, String user2){
//      if(user1[0].toLowerCase().codeUnits[0] > 
//      user2.toLowerCase().codeUnits[0]
//      ) {
//       return "$user1$user2";
//      } else {
//       return "$user2$user1";
//      }
//   }

//   void onSearch() async {
//     FirebaseFirestore _firestore = FirebaseFirestore.instance;
//     setState(() {
//       isLoading = true;
//     });
//     await _firestore
//         .collection('users')
//         .where("email", isEqualTo: _search.text)
//         .get()
//         .then((value) {
//       setState(() {
//         userMap = value.docs[0].data();
//         isLoading = false;
//       });
//       print(userMap);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("Search"),
//           centerTitle: true,
//         ),
//         body: isLoading
//             ? Center(
//                 child: Container(
//                   height: size.height / 20,
//                   width: size.height / 20,
//                   child: CircularProgressIndicator(),
//                 ),
//               )
//             : Column(
//                 children: [
//                   SizedBox(
//                     height: size.height / 20,
//                   ),
//                   Container(
//                       height: size.height / 14,
//                       width: size.width,
//                       alignment: Alignment.center,
//                       child: SizedBox(
//                         height: size.height / 14,
//                         width: size.width / 1.2,
//                         child: TextField(
//                           controller: _search,
//                           decoration: InputDecoration(
//                               hintText: "Search",
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10))),
//                         ),
//                       )),
//                   SBC.xLH,
//                   ElevatedButton(
//                       onPressed: onSearch, child: const Text("Search")),
//                   SizedBox(
//                     height: size.height / 50,
//                   ),
//                   userMap != null
//                       ? Card(
//                           margin: EdgeInsets.symmetric(
//                               horizontal:
//                                   .04 * MediaQuery.of(context).size.width,
//                               vertical: 4),
//                           elevation: 0.5,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15)),
//                           child: InkWell(
//                              onTap: () {
//                           String roomId = chatRoomId(
//                               _firebaseAuth.currentUser!.uid,
//                               userMap!['name']);

//                           Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder: (_) => ChatRoom(
//                                 chatRoomId: roomId,
//                                 userMap: userMap!,
//                               ),
//                             ),
//                           );
//                         },
//                             child: ListTile(
//                               leading: const CircleAvatar(
//                                 child: Icon(CupertinoIcons.person),
//                               ),
//                               title: Text(userMap!['name']),
//                               subtitle: Text(
//                                 userMap!['createdAt'],
//                                 maxLines: 1,
//                               ),
//                               trailing: const CircleAvatar(
//                                 child: Icon(Icons.chat),
//                               ),
//                             ),
//                           ),
//                         )
//                       : Container(),
//                 ],
//               ));
//   }
// }

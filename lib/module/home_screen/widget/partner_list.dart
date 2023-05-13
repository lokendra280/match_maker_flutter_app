// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class FirestoreService {
//   final CollectionReference usersCollection =
//       FirebaseFirestore.instance.collection('users');

//   Stream<QuerySnapshot> getUsers() {
//     return usersCollection.snapshots();
//   }
// }

// class UserListWidget extends StatelessWidget {
//   final FirestoreService firestoreService = FirestoreService();

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: firestoreService.getUsers(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return CircularProgressIndicator();
//         }

//         final users = snapshot.data!.docs;

//         return ListView.builder(
//           itemCount: users.length,
//           itemBuilder: (context, index) {
//             final user = users[index].data();
//             return ListTile(
//               subtitle: Text(user['email']),
//               // Add more widgets to display additional user information
//             );
//           },
//         );
//       },
//     );
//   }
// }

// // Usage:
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Firestore ListView Builder',
//       home: Scaffold(
//         appBar: AppBar(title: Text('Firestore ListView Builder')),
//         body: UserListWidget(),
//       ),
//     );
//   }
// }

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MyApp());
// }

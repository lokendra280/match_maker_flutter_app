// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// Future<User?> createAccount(String name, String email, String password) async {
//   FirebaseAuth _auth = FirebaseAuth.instance;

//   FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   try {
//     UserCredential userCrendetial = await _auth.createUserWithEmailAndPassword(
//         email: email, password: password);

//     print("Account created Succesfull");

//     userCrendetial.user!.updateDisplayName(name);

//     await _firestore.collection('users').doc(_auth.currentUser!.id).set({
//       "name": name,
//       "email": email,
//       "status": "Unavalible",
//       "id": _auth.currentUser!.id,
//     });

//     return userCrendetial.user;
//   } catch (e) {
//     print(e);
//     return null;
//   }
// }

// Future<User?> logIn(String email, String password) async {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   try {
//     UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: email, password: password);

//     print("Login Sucessfull");
//     _firestore
//         .collection('users')
//         .doc(_auth.currentUser!.id)
//         .get()
//         .then((value) => userCredential.user!.updateDisplayName(value['name']));

//     return userCredential.user;
//   } catch (e) {
//     print(e);
//     return null;
//   }
// }

// Future logOut(BuildContext context) async {
//   FirebaseAuth _auth = FirebaseAuth.instance;

//   try {
//     await _auth.signOut().then((value) {
//       // Navigator.push(context, MaterialPageRoute(builder: (_) => Re()));
//     });
//   } catch (e) {
//     print("error");
//   }
// }
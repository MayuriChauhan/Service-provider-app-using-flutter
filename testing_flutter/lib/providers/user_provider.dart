import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProvider with ChangeNotifier{

  void addUserdata({
    required User currentUser,
    required final userName,
    required final userEmail,
    required final userImage})async{
   await FirebaseFirestore.instance.collection("usersData").doc(currentUser.uid).set(
        {
          "username":userName,
          "userEmail":userEmail,
          "userImage":userImage,
          "userUid":currentUser.uid,
        },
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:grocery_app/models/user_model.dart';

class UserProvider with ChangeNotifier {
  addUserData({
    required User currentUser,
    required String userName,
    required String userEmail,
    required String userImage,
    required String phoneNumber,
  }) async {
    FirebaseFirestore.instance.collection("userData").doc(currentUser.uid).set({
      "userName": userName,
      "userEmail": userEmail,
      "userImage": userImage,
      "userUid": currentUser.uid,
    });
    notifyListeners();
  }

   UserModel? _userModel;
  void getUserData() async {
    UserModel currentUser;
    var snapshot = await FirebaseFirestore.instance
        .collection("userData")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    if (snapshot.exists) {

      currentUser=UserModel(
           userId: snapshot.get('userUid'),
           userName: snapshot.get('userName'),
           userEmail: snapshot.get('userEmail'),
           userImage: snapshot.get('userImage'),
       );

      _userModel=currentUser;
    }

  }

  UserModel get currentUserList => _userModel!;
}

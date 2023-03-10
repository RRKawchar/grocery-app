import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class WishListProvider with ChangeNotifier{

  addWishListData(
      {required String wishListId,
        required String wishListName,
        required String wishListImage,
        required int wishListPrice,
        required int wishListQuantity,
      }) async {
    await FirebaseFirestore.instance
        .collection('wishList')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("yourWishList")
        .doc(wishListId)
        .set({
      "wishListId": wishListId,
      "wishListName": wishListName,
      "wishListImage": wishListImage,
      "wishListPrice": wishListPrice,
      'wishListQuantity': wishListQuantity,
      "wishList":true,
    });
  }

}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:grocery_app/models/product_model.dart';

class WishListProvider with ChangeNotifier {
  addWishListData({
    required String wishListId,
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
      "wishList": true,
    });
  }

  /// get wishList data///////////////////
  List<ProductModel> _wishListList = [];
  getWishListData() async {
    List<ProductModel> newList = [];
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("wishList")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('yourWishList')
        .get();

    snapshot.docs.forEach((element) {
      ProductModel productModel = ProductModel(
        productName: element.get('wishListName'),
        productImage: element.get('wishListImage'),
        productPrice: element.get('wishListPrice'),
        productId: element.get('wishListId'),
        productQuantity: element.get('wishListQuantity'),
        productUnit: element.get('productUnit')
      );
      newList.add(productModel);
    });

    _wishListList = newList;
    notifyListeners();
  }

  List<ProductModel> get getWishList => _wishListList;

  /// Delete WishList//////////
  deleteWishList({required String wishListId}) async {
    FirebaseFirestore.instance
        .collection("wishList")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("yourWishList")
        .doc(wishListId)
        .delete();
  }
}

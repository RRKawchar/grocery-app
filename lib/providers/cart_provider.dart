import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/models/cart_model.dart';

class CartProvider with ChangeNotifier {
  /// add to cart /////
  addCartData(
      {required String cartId,
      required String cartName,
      required String cartImage,
      required int cartPrice,
      required int cartQuantity,
      required bool isAdd,
      }) async {
    FirebaseFirestore.instance
        .collection('reviewCart')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("yourReviewCart")
        .doc(cartId)
        .set({
      "cartId": cartId,
      "cartName": cartName,
      "cartImage": cartImage,
      "cartPrice": cartPrice,
      'cartQuantity': cartQuantity,
      "isAdd":isAdd,
    });
  }

  /// get cart data /////
  List<CartModel> cartDataList = [];
  void getCartData() async {
    List<CartModel> newList = [];
    QuerySnapshot cartValue = await FirebaseFirestore.instance
        .collection('reviewCart')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('yourReviewCart')
        .get();
    cartValue.docs.forEach((element) {
      CartModel cartModel = CartModel(
        cartId: element.get('cartId'),
        cartName: element.get('cartName'),
        cartImage: element.get('cartImage'),
        cartPrice: element.get('cartPrice'),
        cartQuantity: element.get('cartQuantity'),
      );
      newList.add(cartModel);
    });
    cartDataList = newList;
    notifyListeners();
  }

  List<CartModel> get getCartDataList {
    return cartDataList;
  }

  /// delete cart data//////
  deleteCartData({required String userId}) async {
    FirebaseFirestore.instance
        .collection("reviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("yourReviewCart")
        .doc(userId)
        .delete();
    notifyListeners();
  }
}

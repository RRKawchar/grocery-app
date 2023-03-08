import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  late ProductModel productModel;


  /// Fetch Herbs Product///

  List<ProductModel> herbProductList = [];
  fetchHerbsProduct() async {
    List<ProductModel> newList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(
          "herbeProduct",
        )
        .get();

    querySnapshot.docs.forEach(
      (element) {
        productModel = ProductModel(
          productName: element.get('productName'),
          productImage: element.get('productImage'),
          productPrice: element.get('productPrice'),
        );
        newList.add(productModel);
      },
    );
    herbProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getHerbsProduct {
    return herbProductList;
  }

  /// Fetch Fresh Fruits///
  List<ProductModel> freshFruitList = [];
  fetchFreshFruit() async {
    List<ProductModel> newList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("freshFruit").get();
    querySnapshot.docs.forEach(
      (element) {
        productModel = ProductModel(
          productName: element.get('productName'),
          productImage: element.get('productImage'),
          productPrice: element.get('productPrice'),
        );
        newList.add(productModel);
        print("This is My Fruit product 1 $newList");
      },
    );
    freshFruitList = newList;

    print('This is my fruit product $freshFruitList');
    notifyListeners();
  }

  List<ProductModel> get getFreshFruit {
    return freshFruitList;
  }
}

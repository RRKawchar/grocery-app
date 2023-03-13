import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  late ProductModel productModel;
  List<ProductModel> search = [];

  productModels(QueryDocumentSnapshot data) {
    productModel = ProductModel(
      productName: data.get("productName"),
      productImage: data.get("productImage"),
      productPrice: data.get("productPrice"),
      productId: data.get('productId'),
      productQuantity: data.get('productQuantity'),
      productUnit: data.get('productUnit'),
    );
    search.add(productModel);
  }

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
        productModels(element);
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
  List<ProductModel> _freshfruitList = [];
  List<ProductModel> get freshList => _freshfruitList;
  Future<void> fetchFruit() async {
    List<ProductModel> newList = [];
    try {
      final collection = FirebaseFirestore.instance.collection('freshFruit');
      QuerySnapshot snapshot = await collection.get();

      snapshot.docs.forEach(
        (element) {
          productModels(element);
          newList.add(productModel);
        },
      );
      _freshfruitList = newList;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  /// fetch root product///
  List<ProductModel> _rootVegetableList = [];

  Future<void> fetchVegetable() async {
    List<ProductModel> newVegetableList = [];
    try {
      final collection = FirebaseFirestore.instance.collection('rootVegetable');
      QuerySnapshot snapshot = await collection.get();
      print('this is fruit snapshot $snapshot');
      snapshot.docs.forEach((element) {
        productModels(element);
        newVegetableList.add(productModel);
      });
      _rootVegetableList = newVegetableList;
      print('this is fruit snapshot $_rootVegetableList');
    } catch (e) {
      print(e.toString());
    }
  }

  List<ProductModel> get vegetableList => _rootVegetableList;

  List<ProductModel> get getAllProductSearch {
    return search;
  }
}

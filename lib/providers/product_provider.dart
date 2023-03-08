import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/models/product_model.dart';

class ProductProvider extends ChangeNotifier{

List<ProductModel> herbProductList=[];

  fetchHerbsProduct()async{

    QuerySnapshot querySnapshot= await FirebaseFirestore.instance.collection("herbeProduct",).get();

    querySnapshot.docs.forEach((element) {
           print(element.data());
    });
  }
}
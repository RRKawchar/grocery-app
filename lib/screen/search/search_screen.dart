import 'package:flutter/material.dart';
import 'package:grocery_app/component/single_item.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/utility/constants.dart';
import 'package:grocery_app/widget/textWidget.dart';

class SearchScreen extends StatefulWidget {

  final List<ProductModel> search;
   SearchScreen({Key? key, required this.search}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query='';

   searchItem(String query){
    List<ProductModel> searchFood=widget.search.where((element){
      return element.productName.toLowerCase().contains(query);
    }).toList();
    return searchFood;
  }

  @override
  Widget build(BuildContext context) {
     List<ProductModel> _searchItem=searchItem(query);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        backgroundColor: primaryColor,
        title: TextWidget(text: "Search",),
      ),
      body:ListView(
        children: [
          ListTile(
            title: TextWidget(text: "items",),
          ),
          Container(
            height: 52,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: (value){
                print(value);
                setState(() {
                  query=value;
                });
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,

                  ),
                  fillColor:const Color(0xffc2c2c2),
                  filled: true,
                  hintText:"Search for item in the store",
                  suffixIcon: const Icon(Icons.search)
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Column(
            children: _searchItem.map((data){
              return SingleItems(
                  isBool: false,
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice,
                cartId: data.productId,
                productQuantity: data.productQuantity,
              );
            }).toList(),
          )


        ],
      ),


    );
  }
}

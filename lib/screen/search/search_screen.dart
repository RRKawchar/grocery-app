import 'package:flutter/material.dart';
import 'package:grocery_app/component/single_item.dart';
import 'package:grocery_app/utility/constants.dart';
import 'package:grocery_app/widget/textWidget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        backgroundColor: primaryColor,
        title: TextWidget(text: "Search",),
      ),
      body: ListView(
        children: [
          ListTile(
            title: TextWidget(text: "items",),
          ),
          Container(
            height: 52,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
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
          SingleItems(isBool: false,),
          SingleItems(isBool: false,),
          SingleItems(isBool: false,),
          SingleItems(isBool: false,),
          SingleItems(isBool: false,),
          // SingleItems(),
          // SingleItems(),
          // SingleItems(),
          // SingleItems(),
          // SingleItems(),
          // SingleItems(),
          // SingleItems(),
        ],
      ),
    );
  }
}

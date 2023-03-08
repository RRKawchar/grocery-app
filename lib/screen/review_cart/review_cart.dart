import 'package:flutter/material.dart';
import 'package:grocery_app/component/single_item.dart';
import 'package:grocery_app/utility/constants.dart';
import 'package:grocery_app/widget/textWidget.dart';

class ReviewCart extends StatelessWidget {
  const ReviewCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        backgroundColor: primaryColor,
        title: TextWidget(text: "Review Cart",size: 18,),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10,),
          SingleItems(isBool: true,),
          SingleItems(isBool: true,),
          const SizedBox(height: 10,),
        ],
      ),
      bottomNavigationBar:ListTile(
      title: TextWidget(text: "Total Amount",),
        subtitle: TextWidget(text: "\$ 170.00",color: Colors.green[900],),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            color: primaryColor,
            onPressed: (){},
            child: const Text('Submit'),
          ),
        ),
      ),
    );
  }
}

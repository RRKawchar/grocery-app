import 'package:flutter/material.dart';
import 'package:grocery_app/widget/textWidget.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network('https://www.pngmart.com/files/3/Watermelon-PNG-File.png',width: 60,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(text: 'food name',color: Colors.grey[600],),
          TextWidget(text: '50 gram',color: Colors.grey[600],),
          TextWidget(text: '\$30',),
          TextWidget(text: '5',),
        ],
      ),
    );
  }
}

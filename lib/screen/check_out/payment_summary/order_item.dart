import 'package:flutter/material.dart';
import 'package:grocery_app/models/cart_model.dart';
import 'package:grocery_app/widget/textWidget.dart';

class OrderItem extends StatelessWidget {
  final CartModel e;
  const OrderItem({Key? key, required this.e}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(e.cartImage,width: 60,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(text: e.cartName,color: Colors.grey[600],),
          TextWidget(text: e.cartUnit,color: Colors.grey[600],),
          TextWidget(text: '\$${e.cartPrice}',),
          TextWidget(text: '${e.cartQuantity}',),
        ],
      ),
    );
  }
}

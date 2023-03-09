import 'package:flutter/material.dart';
import 'package:grocery_app/providers/cart_provider.dart';
import 'package:grocery_app/utility/constants.dart';
import 'package:grocery_app/widget/textWidget.dart';
import 'package:provider/provider.dart';

class Count extends StatefulWidget {
  final String productName;
  final String productImage;
  final String productId;
  final int productPrice;

  const Count({Key? key, required this.productName, required this.productImage, required this.productId, required this.productPrice,}) : super(key: key);

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;
  bool isBool = false;
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider=Provider.of<CartProvider>(context);
    return Container(
      height: 30,
      width: 50,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8)),
      child: isBool == true
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    if (count == 1) {
                      setState(() {
                        isBool = false;
                      });
                    }
                    if (count > 1) {
                      setState(() {
                        count--;
                      });
                    }
                  },
                  child: const Icon(
                    Icons.remove,
                    size: 15,
                    color: Colors.yellow,
                  ),
                ),
                Text(
                  "$count",
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      count++;
                    });
                  },
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      size: 15,
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ],
            )
          : Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    isBool = true;
                  });
                  cartProvider.addCartData(
                      cartId: widget.productId,
                      cartName: widget.productName,
                      cartImage: widget.productImage,
                      cartPrice: widget.productPrice,
                      cartQuantity: count,
                      isAdd: true,
                  );
                },
                child: TextWidget(
                  text: "ADD",
                  color: primaryColor,
                ),
              ),
            ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
   var productUnit;
   Count({
    Key? key,
     this.productUnit,
    required this.productName,
    required this.productImage,
    required this.productId,
    required this.productPrice,
  }) : super(key: key);

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;
  bool isBool = false;

  getAddAndQuantity() {
    FirebaseFirestore.instance
        .collection("reviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("yourReviewCart").doc(widget.productId)
        .get()
        .then((value) =>{
          if(mounted){
            if(value.exists){
              setState((){
                count=value.get('cartQuantity');
                isBool=value.get('isAdd');
              })
            }
          }


    });
  }

  @override
  Widget build(BuildContext context) {
    getAddAndQuantity();
    CartProvider cartProvider = Provider.of<CartProvider>(context);
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
                  onTap: ()async {
                    if (count == 1) {
                      setState(() {
                        isBool = false;
                      });
                     await cartProvider.deleteCartData(userId: widget.productId);
                    }
                   else if (count > 1) {
                      setState(() {
                        count--;
                      });
                      await cartProvider.updateCartData(
                        cartId: widget.productId,
                        cartName: widget.productName,
                        cartImage: widget.productImage,
                        cartPrice: widget.productPrice,
                        cartQuantity: count,
                      );
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
                  onTap: () async{
                    setState(() {
                      count++;
                    });
                   await cartProvider.updateCartData(
                      cartId: widget.productId,
                      cartName: widget.productName,
                      cartImage: widget.productImage,
                      cartPrice: widget.productPrice,
                      cartQuantity: count,
                    );
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
                onTap: ()async {
                  setState(() {
                    isBool = true;
                  });
                 await cartProvider.addCartData(
                    cartId: widget.productId,
                    cartName: widget.productName,
                    cartImage: widget.productImage,
                    cartPrice: widget.productPrice,
                    cartUrni: widget.productUnit,
                    cartQuantity: count,
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

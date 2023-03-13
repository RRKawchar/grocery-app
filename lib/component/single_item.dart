import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_app/providers/cart_provider.dart';
import 'package:grocery_app/utility/constants.dart';
import 'package:grocery_app/widget/count.dart';
import 'package:grocery_app/widget/textWidget.dart';
import 'package:provider/provider.dart';

class SingleItems extends StatefulWidget {
  bool isBool = false;
  String productImage;
  String productName;
  bool wishList;
  int productPrice;
  String cartId;
  int productQuantity;
  var productUnit;
  VoidCallback? onTap;
  SingleItems(
      {Key? key,
      required this.isBool,
      required this.productImage,
      required this.productName,
      this.wishList = false,
      required this.productPrice,
      required this.cartId,
      required this.productQuantity,
         this.productUnit,
      this.onTap,})
      : super(key: key);

  @override
  State<SingleItems> createState() => _SingleItemsState();
}

class _SingleItemsState extends State<SingleItems> {

  late CartProvider cartProvider;


  late int count;
  getCount(){
    setState(() {
      count=widget.productQuantity;
    });
  }

  // @override
  // void initState() {
  //   getCount();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    getCount();
    cartProvider=Provider.of<CartProvider>(context);
    cartProvider.getCartData();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                height: 100,
                child: Center(
                  child: Image.network(widget.productImage),
                ),
              )),
              Expanded(
                child: Container(
                  height: 90,
                  child: Column(
                    mainAxisAlignment: widget.isBool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          TextWidget(
                            text: widget.productName,
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
                          TextWidget(
                            text: "${widget.productPrice}\$/50 gram",
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      widget.isBool == false
                          ? GestureDetector(
                              onTap: () {
                                _showModelSheet(context);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 15),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: Colors.grey)),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: TextWidget(
                                      text: "50 gram",
                                      color: Colors.grey,
                                      size: 14,
                                    )),
                                    const Center(
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        color: primaryColor,
                                        size: 20,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Text(widget.productUnit)
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: widget.isBool == false ? 30 : 60,
                  margin: widget.isBool == false
                      ? const EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                      : const EdgeInsets.only(left: 15, right: 15),
                  child: widget.isBool == false
                      ? Count(
                          productId: widget.cartId,
                          productName: widget.productName,
                          productImage: widget.productImage,
                          productPrice: widget.productPrice,
                        )
                      : Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 1),
                              child: InkWell(
                                onTap: widget.onTap,
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            widget.wishList == true
                                ? Container(
                                    height: 25,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(color: Colors.grey)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                         InkWell(
                                           onTap: (){
                                             if(count==1){
                                               Fluttertoast.showToast(msg: "You reach minimum limit");
                                             }else{
                                               setState(() {
                                                 count--;
                                               });
                                               cartProvider.updateCartData(
                                                   cartId: widget.cartId,
                                                   cartName: widget.productName,
                                                   cartImage: widget.productImage,
                                                   cartPrice: widget.productPrice,
                                                   cartQuantity: count
                                               );
                                             }
                                           },
                                           child: const Icon(
                                            Icons.remove,
                                            color: Colors.yellow,
                                        ),
                                         ),
                                        Expanded(
                                          child: TextWidget(
                                            text: "$count",
                                            color: Colors.yellow,
                                          ),
                                        ),
                                         InkWell(
                                           onTap: (){
                                             if(count<5){
                                               setState(() {
                                                 count++;
                                               });
                                               cartProvider.updateCartData(
                                                   cartId: widget.cartId,
                                                   cartName: widget.productName,
                                                   cartImage: widget.productImage,
                                                   cartPrice: widget.productPrice,
                                                   cartQuantity: count
                                               );
                                             }
                                           },
                                           child: Icon(
                                            Icons.add,
                                            color: Colors.yellow,
                                        ),
                                         ),
                                      ],
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
        widget.isBool == false
            ? Container()
            : const Divider(
                height: 1,
                color: Colors.black45,
              )
      ],
    );
  }

  void _showModelSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Wrap(
              children: <Widget>[
                ListTile(title: const Text('50 Gram'), onTap: () => {}),
                ListTile(
                  title: const Text('500 Gram'),
                  onTap: () => {},
                ),
                ListTile(
                  title: const Text('1 kg'),
                  onTap: () => {},
                ),
              ],
            ),
          );
        });
  }
}

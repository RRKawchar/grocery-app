import 'package:flutter/material.dart';
import 'package:grocery_app/utility/constants.dart';
import 'package:grocery_app/widget/textWidget.dart';

class SingleItems extends StatelessWidget {
  bool isBool = false;
  String productImage;
  String productName;
  int productPrice;
  String cartId;
  int productQuantity;
  VoidCallback? onTap;
  SingleItems({Key? key, required this.isBool,required this.productImage,required this.productName,required this.productPrice,required this.cartId,required this.productQuantity, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
                  child: Image.network(
                      productImage),
                ),
              )),
              Expanded(
                child: Container(
                  height: 90,
                  child: Column(
                    mainAxisAlignment: isBool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          TextWidget(
                            text: productName,
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
                          TextWidget(
                            text: "$productPrice\$/50 gram",
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      isBool == false
                          ? Container(
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
                            )
                          : const Text("50 gram")
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height:isBool==false? 30:60,
                  margin: isBool == false
                      ? const EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                      : const EdgeInsets.only(left: 15, right: 15),
                  child: isBool == false
                      ? Container(
                          height: 25,
                          width: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.add,
                                color: Colors.yellow,
                              ),
                             TextWidget(
                                text: "ADD",
                                color: Colors.yellow,
                              ),
                            ],
                          ),
                        )
                      : Column(
                          children: [
                             InkWell(
                               onTap: onTap,
                               child: Icon(
                                Icons.delete,
                                color: Colors.black54,
                            ),
                             ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 25,
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: Colors.grey)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.add,
                                    color: Colors.yellow,
                                  ),
                                  Expanded(
                                    child: TextWidget(
                                      text: "ADD",
                                      color: Colors.yellow,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                ),
              ),

            ],
          ),
        ),
        isBool==false?Container():const Divider(
          height: 1,
          color: Colors.black45,
        )
      ],
    );
  }
}

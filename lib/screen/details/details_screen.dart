import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/providers/wish_list_provider.dart';
import 'package:grocery_app/screen/review_cart/review_cart.dart';
import 'package:grocery_app/utility/constants.dart';
import 'package:grocery_app/widget/count.dart';
import 'package:grocery_app/widget/textWidget.dart';
import 'package:provider/provider.dart';

enum SingInCharacter { fill, outLine }

class DetailsScreen extends StatefulWidget {
  final String productName;
  final String productImage;
  final int productPrice;
  final String productId;
  const DetailsScreen(
      {Key? key,
      required this.productName,
      required this.productImage,
      required this.productPrice,
      required this.productId})
      : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  SingInCharacter _singInCharacter = SingInCharacter.fill;

  bool wishListBool = false;

  getWishLitStatus() {
    FirebaseFirestore.instance
        .collection("wishList")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("yourWishList")
        .doc(widget.productId)
        .get()
        .then((value) => {
              if (mounted)
                {
                  if (value.exists)
                    {
                      setState(() {
                        wishListBool = value.get('wishList');
                      })
                    }
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    WishListProvider wishListProvider = Provider.of<WishListProvider>(context);
    getWishLitStatus();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: TextWidget(
          text: "Product Details",
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  ListTile(
                    title: TextWidget(text: widget.productName ?? ""),
                    subtitle: TextWidget(
                      text: "\$${widget.productPrice}",
                    ),
                  ),
                  Container(
                    height: 250,
                    padding: const EdgeInsets.all(40),
                    child: Image.network(widget.productImage ?? ""),
                  ),
                  Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextWidget(
                        text: "Available Options",
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.green[700],
                            ),
                            Radio(
                                activeColor: Colors.green[700],
                                value: SingInCharacter.fill,
                                groupValue: _singInCharacter,
                                onChanged: (value) {
                                  setState(() {
                                    _singInCharacter = value!;
                                  });
                                })
                          ],
                        ),
                        TextWidget(text: "\$50"),
                        Count(
                          productName: widget.productName,
                          productImage: widget.productImage,
                          productId: widget.productId,
                          productPrice: widget.productPrice,
                          productUnit: '500 gram',
                        )
                        // Container(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 30, vertical: 10),
                        //   decoration: BoxDecoration(
                        //       border: Border.all(color: Colors.grey),
                        //       borderRadius: BorderRadius.circular(30)),
                        //   child: Row(
                        //     children: [
                        //       const Icon(
                        //         Icons.add,
                        //         size: 15,
                        //         color: primaryColor,
                        //       ),
                        //       TextWidget(
                        //         text: "ADD",
                        //         color: primaryColor,
                        //       )
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: "About this product",
                  size: 18,
                  color: textColor,
                ),
                TextWidget(
                  text:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's"
                      " standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
                  size: 16,
                  color: textColor,
                ),
              ],
            ),
          ))
        ],
      ),
      bottomNavigationBar: Row(
        children: [
          bottomNavigationBar(
              icon: wishListBool == false
                  ? Icons.favorite_outline
                  : Icons.favorite,
              title: "Add To WishList",
              backgroundColor: primaryColor,
              textColor: textColor,
              onTap: () {
                setState(() {
                  wishListBool = !wishListBool;
                });

                if (wishListBool == true) {
                  wishListProvider.addWishListData(
                      wishListId: widget.productId,
                      wishListName: widget.productName,
                      wishListImage: widget.productImage,
                      wishListPrice: widget.productPrice,
                      wishListQuantity: 2);
                } else {
                  wishListProvider.deleteWishList(wishListId: widget.productId);
                }
              }),
          bottomNavigationBar(
              icon: Icons.shop_outlined,
              title: "Go to cart",
              backgroundColor: Colors.black87,
              textColor: Colors.white,
              iconColor: Colors.white,
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewCart()));
              }
          ),
        ],
      ),
    );
  }

  Widget bottomNavigationBar({
    Color? iconColor,
    Color? backgroundColor,
    Color? textColor,
    required IconData icon,
    required String title,
    VoidCallback? onTap,
  }) {
    return Expanded(
        child: InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 17,
            ),
            const SizedBox(
              width: 5,
            ),
            TextWidget(
              text: title,
              color: textColor,
            )
          ],
        ),
      ),
    ));
  }
}

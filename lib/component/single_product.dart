import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/widget/build_image.dart';

class SingleProduct extends StatelessWidget {

  final String imageUrl;
  final String title;
  final int productPrice;
 final void Function() onTap;
  const SingleProduct({Key? key,  required this.onTap,required this.imageUrl, required this.title,required this.productPrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(5),
      height: 230,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 2, child: InkWell(
              onTap: onTap,
              child:BuildImage(size: size,imgUrl: imageUrl,))),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Text(title,maxLines: 2,overflow: TextOverflow.ellipsis,)),
                     Text(
                      "$productPrice\$/50 gram",
                      style:const TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(left: 2),
                              height: 30,
                              width: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                children: const [
                                  Expanded(
                                      child: Text(
                                        "50 gram",
                                        style: TextStyle(fontSize: 10),
                                      )),
                                  Center(
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        size: 20,
                                        color: Colors.yellow,
                                      ))
                                ],
                              ),
                            )),
                        const SizedBox(width: 5),
                        Expanded(
                            child: Container(
                              height: 30,
                              width: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Icon(
                                    Icons.remove,
                                    size: 15,
                                    color: Colors.yellow,
                                  ),
                                  Text(
                                    "1",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.yellow),
                                  ),
                                  Icon(
                                    Icons.add,
                                    size: 15,
                                    color: Colors.yellow,
                                  ),
                                ],
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }


}

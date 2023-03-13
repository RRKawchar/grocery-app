import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/utility/constants.dart';
import 'package:grocery_app/widget/build_image.dart';
import 'package:grocery_app/widget/count.dart';
import 'package:grocery_app/widget/product_unit.dart';
import 'package:grocery_app/widget/textWidget.dart';

class SingleProduct extends StatefulWidget {
  final String productImage;
  final String productName;
  final int productPrice;
  final void Function() onTap;
  final String productId;
  final ProductModel productUnit;
  const SingleProduct(
      {Key? key,
      required this.onTap,
      required this.productImage,
      required this.productName,
      required this.productPrice,
      required this.productId,
      required this.productUnit})
      : super(key: key);

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {

  var unitData;
  var firstValue;
  @override
  Widget build(BuildContext context) {

    widget.productUnit.productUnit.firstWhere((element){
      setState(() {
         firstValue=element;
      });
      return true;
    });
    final size = MediaQuery.of(context).size;
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
          Expanded(
              flex: 2,
              child: InkWell(
                  onTap: widget.onTap,
                  child: BuildImage(
                    size: size,
                    imgUrl: widget.productImage,
                  ))),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Text(
                  widget.productName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
                Text(
                  "${widget.productPrice}\$/${unitData ?? firstValue}",
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: ProductUnit(
                        onTap: () {
                          _showModelSheet(context);
                        },
                        title: unitData ?? firstValue,
                      )


                          ),
                      const SizedBox(width: 5),
                      Expanded(
                          child: Count(
                        productId: widget.productId,
                        productName: widget.productName,
                        productImage: widget.productImage,
                        productPrice: widget.productPrice,
                            productUnit: unitData ?? firstValue,
                      )),
                    ],
                  ),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }

  void _showModelSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.productUnit.productUnit.map<Widget>((data){
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: InkWell(
                      onTap: ()async{
                        setState(() {
                          unitData=data;
                        });
                        Navigator.pop(context);
                      },
                      child: TextWidget(text: data,size: 18,color: primaryColor,),
                    ),
                  )
                ],
              );
            }).toList(),
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:grocery_app/component/single_item.dart';
import 'package:grocery_app/models/cart_model.dart';
import 'package:grocery_app/providers/cart_provider.dart';
import 'package:grocery_app/utility/constants.dart';
import 'package:grocery_app/widget/textWidget.dart';
import 'package:provider/provider.dart';

class ReviewCart extends StatelessWidget {


  late CartProvider cartProvider;

  @override
  Widget build(BuildContext context) {
    cartProvider=Provider.of<CartProvider>(context);
    cartProvider.getCartData();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        backgroundColor: primaryColor,
        title: TextWidget(text: "Review Cart",size: 18,),
      ),
      body: cartProvider.getCartDataList.isEmpty?Center(child: TextWidget(text: "No Found Cart",),):ListView.builder(
          itemCount: cartProvider.getCartDataList.length,
          itemBuilder: (context,index){
            final data=cartProvider.getCartDataList[index];
            return Column(
              children: [
                const SizedBox(height: 10,),
                SingleItems(
                  isBool: true,
                  wishList: true,
                  productImage: data.cartImage,
                  productName: data.cartName,
                  productPrice: data.cartPrice,
                  cartId: data.cartId,
                  productQuantity: data.cartQuantity,
                  productUnit: data.cartUnit,
                  onTap: (){
                   showAlertDialog(context,data);
                  },
                ),
              ],
            );
      }),

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
  showAlertDialog(BuildContext context,CartModel delete) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("No"),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Yes"),
      onPressed:  () {
        cartProvider.deleteCartData(userId: delete.cartId);
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Cart Product"),
      content: const Text("Are you want to delete this cart item?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

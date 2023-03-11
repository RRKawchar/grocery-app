import 'package:flutter/material.dart';
import 'package:grocery_app/component/single_item.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/providers/wish_list_provider.dart';
import 'package:grocery_app/utility/constants.dart';
import 'package:grocery_app/widget/textWidget.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatelessWidget {


   late WishListProvider  wishListProvider;

  @override
  Widget build(BuildContext context) {
    wishListProvider=Provider.of<WishListProvider>(context);
    wishListProvider.getWishListData();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.black
        ),
        backgroundColor: primaryColor,
        title: TextWidget(text: "WishList",size: 18,),
      ),
      body: wishListProvider.getWishList.isEmpty?Center(child: TextWidget(text: "No Found WishList Data",),):ListView.builder(
          itemCount: wishListProvider.getWishList.length,
          itemBuilder: (context,index){
            final data=wishListProvider.getWishList[index];
            return Column(
              children: [
                const SizedBox(height: 10,),
                SingleItems(
                  isBool: true,
                  productImage: data.productImage,
                  productName: data.productName,
                  productPrice: data.productPrice,
                  cartId: data.productId,
                  productQuantity: data.productQuantity,
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
   showAlertDialog(BuildContext context,ProductModel delete) {

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
         wishListProvider.deleteWishList(wishListId: delete.productId);
         Navigator.pop(context);
       },
     );

     // set up the AlertDialog
     AlertDialog alert = AlertDialog(
       title: const Text("WishList Product"),
       content: const Text("Are you want to delete this WishList item?"),
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

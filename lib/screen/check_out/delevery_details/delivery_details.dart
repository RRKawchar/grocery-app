import 'package:flutter/material.dart';
import 'package:grocery_app/screen/check_out/add_delivery_address/add_delivery_address.dart';
import 'package:grocery_app/screen/check_out/delevery_details/single_delivery_items.dart';
import 'package:grocery_app/utility/constants.dart';

class DeliveryDetails extends StatelessWidget {
  const DeliveryDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Delivery Address"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: (){},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: MaterialButton(
          height: 48,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          color: primaryColor,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> AddDeliveryAddress(),),);
          },
          child: const Text("Add new Address"),
        ),
      ),
      body: ListView(
        children: [
          const ListTile(
            title: Text('Delivery To'),
            leading: Icon(Icons.location_on),
          ),
          const Divider(
            thickness: 1,
          ),
          Column(
            children: [
              SingleDeliveryItems(
                address: "Dhaka/Bangladesh, sector 14, road 22, house 12",
                title: "Riyazur Rohman Kawchar",
                addressType: "Home",
                number: "028545455646554",
              )
            ],
          )
        ],
      ),
    );
  }
}
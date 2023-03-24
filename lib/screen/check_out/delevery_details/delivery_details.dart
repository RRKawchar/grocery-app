import 'package:flutter/material.dart';
import 'package:grocery_app/providers/check_out_provider.dart';
import 'package:grocery_app/screen/check_out/add_delivery_address/add_delivery_address.dart';
import 'package:grocery_app/screen/check_out/delevery_details/single_delivery_items.dart';
import 'package:grocery_app/screen/check_out/payment_summary/payment_summary.dart';
import 'package:grocery_app/utility/constants.dart';
import 'package:provider/provider.dart';

class DeliveryDetails extends StatelessWidget {

  DeliveryDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    CheckOutProvider checkOutProvider=Provider.of(context);
      checkOutProvider.getDeliveryAddressData();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Delivery Address"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddDeliveryAddress(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: MaterialButton(
          height: 48,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: primaryColor,
          onPressed: () {
            checkOutProvider.getDeliveryAddressLis.isEmpty
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddDeliveryAddress(),
                    ),
                  )
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentSummary(),
                    ),
                  );
          },
          child: checkOutProvider.getDeliveryAddressLis.isEmpty
              ? const Text("Add new Address")
              : const Text("Payment summary"),
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
          checkOutProvider.getDeliveryAddressLis.isEmpty?Container(
            child: const Center(
              child: Text("No Data"),
            ),
          ):
          Column(
            children: checkOutProvider.getDeliveryAddressLis.map((e){
              return SingleDeliveryItems(
                address: "${e.cityName}/${e.cityName}, ${e.roadNo}, ${e.houseNo}, ${e.pinCode}",
                title: "${e.firstName} ${e.lastName}",
                addressType: e.addressType=="AddressType.other"?"Other" :e.addressType=="AddressType.home"?'Home':'work',
                number: e.mobile,
              );

            }).toList(),
          )
        ],
      ),
    );
  }
}
